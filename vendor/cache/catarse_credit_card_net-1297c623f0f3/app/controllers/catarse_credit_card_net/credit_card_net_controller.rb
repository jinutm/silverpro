class CatarseCreditCardNet::CreditCardNetController < ApplicationController
  SCOPE = "controllers.projects.contributions.pay"

  skip_before_filter :force_http
  layout :false

  def review
  end

  def pay
    contribution.update_attributes payment_method: 'AuthorizeNet'

    begin

      card_options = {
        card_type: card_type(params[:card_number]),
        card_number: params[:card_number],
        card_code: params[:card_code],
        card_month: params[:card_month],
        card_year: params[:card_year]
      }

      card = credit_card(card_options)

      if card.valid?
        _test = (::Configuration[:test_payments] == 'true')

        an_login_id = ::Configuration[:authorizenet_login_id]
        an_transaction_key = ::Configuration[:authorizenet_transaction_key]

        gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new({
          :login => an_login_id,
          :password => an_transaction_key,
          :test => _test
        })

        response = gateway.purchase(contribution.price_in_cents_with_tax, card, customer_info(contribution))

        PaymentEngines.create_payment_notification contribution_id: contribution.id, extra_data: response.inspect

        contribution.update_attributes payment_id: response.params['transaction_id']
        contribution.update_attributes payment_token: response.params['transaction_id']

        if response.success?
          contribution.confirm!

          session[:thank_you_id] = contribution.project.id
          session[:_payment_token] = contribution.payment_token

          flash[:success] = t('controllers.projects.contributions.pay.success')

          return render :json => { process_status: 'ok', message: response.message } if request.xhr?
          redirect_to main_app.project_contribution_path(contribution.project, contribution)
        else
          return render :json => { process_status: 'error', message: response.message } if request.xhr?
          flash[:failure] = response.message
          redirect_to main_app.new_project_contribution_path(contribution.project, contribution)
        end
      else
        return render :json => { process_status: 'error', message: card.errors.full_messages.to_sentence } if request.xhr?
        flash[:failure] = card.errors.full_messages.to_sentence
        redirect_to main_app.new_project_contribution_path(contribution.project, contribution)
      end
    rescue Exception => e
      Rails.logger.info "Checkout direct credit card error -----> #{e.inspect}"

      return render :json => { process_status: 'error', message: I18n.t('controllers.projects.contributions.pay.error') } if request.xhr?

      flash[:failure] = I18n.t('controllers.projects.contributions.pay.error')
      redirect_to main_app.new_project_contribution_path(contribution.project, contribution)
    end
  end

  protected

  def contribution
    @contribution ||= if params['id']
                  PaymentEngines.find_payment(id: params['id'])
                end
  end

  def card_type(number)
    return 'visa' if number.match /^4[0-9]{12}(?:[0-9]{3})?$/
    return 'master' if number.match /^5[1-5][0-9]{14}$/
    return 'american_express' if number.match /^3[47][0-9]{13}$/
    return 'discover' if number.match /^6(?:011|5[0-9]{2})[0-9]{12}$/
    return 'dinners_club' if number.match /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/
    return 'jcb' if number.match /^(?:2131|1800|35\d{3})\d{11}$/
  end

  def customer_info(contribution)
    {
      :ip => request.remote_ip,
      :description => t('credit_card_description', scope: SCOPE, :project_name => contribution.project.name, :value => contribution.display_value),
      :billing_address => {
        :name     => full_name,
        :address1 => current_user.address_street,
        :city     => current_user.address_city,
        :state    => current_user.address_state,
        :country  => "US",
        :zip      => current_user.address_zip_code
      }
    }
  end

  def credit_card(options)
    if full_name
      splited = full_name.split(" ")
      last_name = splited.last
      splited.delete(last_name)
      first_name = splited.join(' ')
    end

    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => options[:card_type],
      :number             => options[:card_number],
      :verification_value => options[:card_code],
      :month              => options[:card_month],
      :year               => options[:card_year],
      :first_name         => first_name,
      :last_name          => last_name
    )
  end

  def full_name
    return current_user.full_name unless params[:billing_first_name].present? && params[:billing_last_name].present?
    "#{params[:billing_first_name]} #{params[:billing_last_name]}"
  end
end

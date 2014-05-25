class  CatarseEcheckNet::EcheckNetController < ApplicationController
  SCOPE = "controllers.projects.backers.pay"
  skip_before_filter :force_http
  layout :false

  def review
  end

  def check_routing_number
    routing_number = RoutingNumber.find_by_number(params[:number])
    if routing_number.present?
      render json: { ok: routing_number.present?, bank_name: routing_number.bank_name }
    else
      render json: { ok: routing_number.present? }
    end
  end

  def pay
    begin
      contribution.update_attributes payment_method: 'eCheckNet'

      #NOTE: AuthorizeNet AIM Transacation needs to a new instance every time
      _test = (::Configuration[:test_payments] == 'true')

      an_login_id = ::Configuration[:authorizenet_login_id]
      an_transaction_key = ::Configuration[:authorizenet_transaction_key]
      an_gateway = _test ? :sandbox : :production

      gateway = ::AuthorizeNet::AIM::Transaction.new(an_login_id, an_transaction_key, gateway: an_gateway )

      rn = RoutingNumber.find_by_number(params["routing_number"])
      check = ::AuthorizeNet::ECheck.new(params["routing_number"], params["account_number"], rn.bank_name, params["account_holder_name"])

      gateway.set_fields(customer_info(backer))
      response = gateway.purchase(contribution.price_with_tax.to_s, check)

      PaymentEngines.create_payment_notification contribution_id: contribution.id, extra_data: response.inspect

      if response.success?
        contribution.update_attribute :payment_id, response.transaction_id
        contribution.update_attribute :payment_token, response.transaction_id

        session[:thank_you_id] = contribution.project.id
        session[:_payment_token] = contribution.payment_token

        flash[:success] = t('controllers.projects.contributions.pay.success')

        return render :json => { process_status: 'ok', message: response.fields[:response_reason_text]} if request.xhr?

        redirect_to project_contribution_path(contribution.project, contribution)
      else
        return render :json => { process_status: 'error', message: response.fields[:response_reason_text]} if request.xhr?
        flash[:failure] = response.fields[:response_reason_text]
        redirect_to pay_echeck_net_path(contribution)
      end

    rescue Exception => e
      Rails.logger.info "-----> #{e.inspect}"
      flash[:failure] = 'OPS, occour some error when tryed make you payment.'
      return render :json => { process_status: 'error', message: 'OPS, occour some error when tryed make you payment.'} if request.xhr?
      return redirect_to main_app.new_project_contribution_path(contribution.project)
    end
  end

  protected

  def contribution
    @contribution ||= if params['id']
                  PaymentEngines.find_payment(id: params['id'])
                end
  end

  def customer_info(backer)
    {
      :description => t('echeck_description', scope: SCOPE, :project_name => backer.project.name, :value => backer.display_value),
      :first_name => current_user.first_name,
      :last_name => current_user.last_name,
      :address => current_user.address_street,
      :city     => current_user.address_city,
      :state    => current_user.address_state,
      :country  => "US",
      :zip_code => current_user.address_zip_code,
      :phone    => current_user.phone_number
    }
  end
end

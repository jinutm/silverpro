module CatarseMailchimp
  class Railtie < Rails::Railtie
    initializer 'catarse_mailchimp.active_record' do
      ActiveSupport.on_load :active_record do
        extend ::CatarseMailchimp::ActiveRecord
      end
    end
  end
end

module CatarseMailchimp
  module API
    extend self

    def subscribe(hash, list_id)
      subscribe_params = {
        id: list_id.to_s,
        batch: [ hash ]
      }

      mailchimp_api.list_batch_subscribe(subscribe_params)
    end

    def unsubscribe(email, list_id)
      unsubscribe_params = {
        id: list_id.to_s,
        emails: [email],
        delete_member: true,
        send_goodbye: true
      }

      mailchimp_api.list_batch_unsubscribe(unsubscribe_params)
    end
    
    protected

    def mailchimp_api
      Mailchimp::API.new(MAILCHIMP_API_KEY)
    end
  end
end

module CatarseMailchimp
  module ActiveRecord
    # USAGE
    #
    #   class User < ActiveRecord::Base
    #     sync_with_mailchimp subscribe_data: ->(user) { { EMAIL: user.email, NAME: user.name } },
    #                         list_id: 'listID',
    #                         subscribe_when: ->(user) { user.newsletter_changed? && user.newsletter },
    #                         unsubscribe_when: ->(user) { user.newsletter_changed? && !user.newsletter },
    #                         ubsubscribe_email: ->(user) { user.email }
    #
    #   end
    #
    def sync_with_mailchimp options
      self.class_eval <<-RUBY
        before_save do

          if options[:subscribe_when].call(self)
            CatarseMailchimp::API.subscribe(options[:subscribe_data].call(self), options[:list_id])
          end

          if options[:unsubscribe_when].call(self)
            CatarseMailchimp::API.unsubscribe(options[:unsubscribe_email].call(self), options[:list_id])
          end

        end
      RUBY
    end
  end
end

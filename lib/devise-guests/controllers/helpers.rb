module DeviseGuests::Controllers
  module Helpers
    extend ActiveSupport::Concern

    included do
      include ActiveSupport::Callbacks
    end

    module ClassMethods

    end

    def self.define_helpers(mapping) #:nodoc:
      class_name = mapping.class_name
      mapping = mapping.name

      class_eval <<-METHODS, __FILE__, __LINE__ + 1

        def guest_#{mapping}
          return @guest_#{mapping} if @guest_#{mapping}

          if session[:guest_#{mapping}_id]
            @guest_#{mapping} = #{class_name}.find_by(#{class_name}.authentication_keys.first => session[:guest_#{mapping}_id]) rescue nil
            @guest_#{mapping} = nil if @guest_#{mapping}.respond_to? :guest and !@guest_#{mapping}.guest 
          end

          @guest_#{mapping} ||= begin
            u = create_guest_#{mapping}(session[:guest_#{mapping}_id])
            session[:guest_#{mapping}_id] = u.send(#{class_name}.authentication_keys.first)
            u
          end

          @guest_#{mapping}
        end

        def current_or_guest_#{mapping}
          if current_#{mapping}
            if session[:guest_#{mapping}_id]
              run_callbacks :logging_in_#{mapping} do
                guest_#{mapping}.destroy
                session[:guest_#{mapping}_id] = nil
              end
            end
            current_#{mapping}
          else
            guest_#{mapping}
          end
        end

        private
        def create_guest_#{mapping} key = nil
          auth_key = #{class_name}.authentication_keys.first
          #{class_name}.new do |g|
            g.send("\#{auth_key}=", send(:"guest_\#{auth_key}_authentication_key", key))
            g.guest = true if g.respond_to? :guest
            g.skip_confirmation! if g.respond_to?(:skip_confirmation!)
            g.save(validate: false)
          end
        end

        def guest_email_authentication_key key
          key &&= nil unless key.to_s.match(/^guest/)
          key ||= "guest_" + guest_#{mapping}_unique_suffix + "@example.com"
        end

        def guest_#{mapping}_unique_suffix
          Devise.friendly_token + "_" + Time.now.to_i.to_s + "_" + unique_#{mapping}_counter.to_s
        end

        def unique_#{mapping}_counter
          @@unique_#{mapping}_counter ||= 0
          @@unique_#{mapping}_counter += 1
        end

      METHODS

      ActiveSupport.on_load(:action_controller) do
        helper_method "guest_#{mapping}", "current_or_guest_#{mapping}"
        define_callbacks "logging_in_#{mapping}"
      end
    end
  end
end

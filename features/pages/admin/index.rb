require_relative '../base' # TODO why is this needed?

module Pages
  module Admin
    class Index < Pages::Base
      def login_form
        Components::LoginForm.new(find('.depot_form'))
      end
      
      def has_login_form?
        has_content?('Please Log In')
      end

      def path
        '/admin'
      end
      
      def sign_in(*args)
        login_form.sign_in(*args)
      end
      
      def welcomed?
        has_content?('Welcome')
      end
      
      def denied_access?
        notice == 'Invalid user/password combination'
      end
    end
  end
end

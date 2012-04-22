require_relative '../base' # TODO why is this needed?

module Pages
  module Admin
    class Index < Pages::Base

      path 'admin'

      component(:login_form) do
        Components::LoginForm.new find('.depot_form')
      end
      
      def has_login_form?
        source.has_content?('Please Log In')
      end
      
      def sign_in(*args)
        login_form.sign_in(*args)
      end
      
      def welcomed?
        source.has_content?('Welcome')
      end
      
      def denied_access?
        notice == 'Invalid user/password combination'
      end
    end
  end
end

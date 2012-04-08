module Components
  class LoginForm < CapybaraPageObject::Form
    def sign_in(name, password)
      source.fill_in 'Name', :with => name
      source.fill_in 'Password', :with => password
      source.click_button 'Login'
    end
  end
end

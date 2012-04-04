module Component
  class CheckoutForm < CapybaraPageObject::Form
    # TODO how to avoid needing source here?
    def name=(name)
      source.fill_in 'Name', :with => name
    end

    def email=(email)
      source.fill_in 'Email', :with => email
    end

    def address=(address)
      source.fill_in 'Address', :with => address
    end

    def pay_type=(pay_type)
      source.select pay_type, :from => :pay_type
    end

    def place_order!
      source.click_button 'Place Order'
    end
  end
end

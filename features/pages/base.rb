module Pages
  class Base < CapybaraPageObject::Page

    def cart
      Component::Cart.new find('#cart')
    end

    def checkout_available?
      cart.checkout_available?
    end

    def errors
      all('#error_explanation ul li').collect(&:text)
    end

    def notice
      find('#notice').text
    end
  end
end

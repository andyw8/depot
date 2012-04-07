module Pages
  class Base < CapybaraPageObject::Node
    def cart
      Component::Cart.new find('#cart')
    end

    def checkout_available?
      cart.checkout_available?
    end

    def errors
      all('#error_explanation ul li').collect(&:text)
    end
  end
end

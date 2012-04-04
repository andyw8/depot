module Pages
  class Base < CapybaraPageObject::Node
    def cart
      Component::Cart.new find('#cart')
    end
  
    def checkout_available?
      cart.checkout_available?
    end
  end
end

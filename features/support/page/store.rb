module Page 
  class Store < CapybaraPageObject::Node
    def product_titles
      all('#main .entry h3').collect(&:text)
    end

    def path
      '/'
    end
    
    def cart
      Component::Cart.new find('#cart')
    end
  end
end

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
    
    def add_product(title)
      header = find('h3', :text => title)
      entry = header.parent
      entry.click_button 'Add to Cart'
    end
  end
end

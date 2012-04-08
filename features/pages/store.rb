module Pages
  class Store < Pages::Base
    def product_titles
      all('#main .entry h3').collect(&:text)
    end

    def path
      '/'
    end
    
    def cart
      Components::Cart.new find('#cart')
    end
    
    def add_product(title)
      header = find('h3', :text => title)
      entry = header.find(:xpath, '..') # TODO why doesn't parent work here?
      entry.click_button 'Add to Cart'
    end
  end
end

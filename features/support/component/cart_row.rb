module Component
  class CartRow < CapybaraPageObject::Node
    def quantity
      multiplication_sign = "\u00d7"
      all('td')[0].text.gsub(multiplication_sign, '') # the 1st column in the table
    end
    
    def product
      all('td')[1].text # the 2nd column in the table
    end
  end
end

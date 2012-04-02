module Component
  class Cart < CapybaraPageObject::Node
    def empty?
      rows.empty?
    end
    
    private
    
    def rows
      all('table tr[@class!="total_line"]')
    end
  end
end

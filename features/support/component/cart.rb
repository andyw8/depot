module Component
  class Cart < CapybaraPageObject::Node
    def empty?
      rows.empty?
    end

    def contents
      r = []
      rows.each do |row|
        multiplication_sign = "\u00d7"
        quantity = row.all('td')[0].text.gsub(multiplication_sign, '') # the 1st column in the table
        product = row.all('td')[1].text # the 2nd column in the table
        r << {'product' => product, 'quantity' => quantity}
      end
      r
    end

    private

    def rows
      all('table tr:not(.total_line)')
    end
  end
end

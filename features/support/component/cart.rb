module Component
  class Cart < CapybaraPageObject::Node
    def empty?
      rows.empty?
    end

    def contents
      rows.map do |row|
        {'product' => row.product, 'quantity' => row.quantity}
      end
    end

    private

    def rows
      all('table tr:not(.total_line)').map do |row|
        Component::CartRow.new(row)
      end
    end
  end
end

module Component
  class OrdersTable < CapybaraPageObject::Table

    # TODO this seems messy, should I call #rows ?
    def orders
      r = []
      source.all('tr').each do |tr|
        next if tr.has_css?('th') # skip header row
        orders_table_row = Component::OrdersTableRow.new(tr)
        r << orders_table_row
      end
      r
    end
  end
end

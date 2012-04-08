module Component
  class OrdersTableRow
    
    def initialize(row)
      @row = row
    end
    
    NAME_COLUMN_INDEX = 0
    ADDRESS_COLUMN_INDEX = 1
    EMAIL_COLUMN_INDEX = 2
    PAY_TYPE_COLUMN_INDEX = 3

    # def initialize(row)
    #   @row = row
    #   super(row)
    # end

    def name
      @row.all('td')[NAME_COLUMN_INDEX].text
    end

    def address
      @row.all('td')[ADDRESS_COLUMN_INDEX].text
    end

    def email
      @row.all('td')[EMAIL_COLUMN_INDEX].text
    end

    def pay_type
      @row.all('td')[PAY_TYPE_COLUMN_INDEX].text
    end
  end
end

require './good.rb'

class Book < Good
    def sales_taxable
        0
    end
end
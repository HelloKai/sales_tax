require './good.rb'

class Medicine < Good
    def sales_taxable
        0
    end
end
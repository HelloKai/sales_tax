class Good
    attr_accessor :name, :price, :imported, :sales_tax, :import_tax, :total_tax

    def initialize(name, price, imported)
        @name = name
        @price = price
        @imported = imported
        @sales_tax = 0
        @import_tax = 0
    end

    def sales_taxable
        @sales_tax = ((price*0.10)*20).ceil / 20.00
        @sales_tax.to_f
    end

    def import_taxable
        return 0 unless @imported
        @import_tax = ((price*0.05)*20).ceil / 20.00
        @import_tax.to_f
    end

    def total_tax
        @total_tax = sales_taxable + import_taxable
    end
end
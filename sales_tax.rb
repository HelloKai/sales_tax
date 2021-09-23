require './food.rb'
require './book.rb'
require './medicine.rb'
require './good.rb'

class SalesTax
    def initialize
        @total_tax = 0
        @total_price = 0
    end

    def is_food?
        ['chocolate bar', 'imported box of chocolates', 'box of imported chocolates'].include?(@good)
    end

    def is_medicine?
        ['packet of headache pills'].include?(@good)
    end

    def is_book?
        ['book'].include?(@good)
    end

    def print_receipt(items)
        # items is a txt file
        File.open(items).each do |item|
            process_input(item)

            if is_food?
                food = Food.new(@good, @price, @imported)
                tax = food.total_tax
            elsif is_medicine?
                med = Medicine.new(@good, @price, @imported)
                tax = med.total_tax
            elsif is_book?
                book = Book.new(@good, @price, @imported)
                tax = book.total_tax
            else
                misc = Good.new(@good, @price, @imported)
                tax = misc.total_tax
            end

            @total_tax += tax*@quantity
            @total_price += @price*@quantity

            puts "#{@quantity} #{@good}: #{(@price + tax).round(2)*@quantity}"
        end

        puts "Sales Taxes: #{@total_tax.ceil(2)}"
        puts "Total: #{@total_price + @total_tax}"
    end

    def process_input(item)
        @array = item.split(" ")
        @quantity = @array[0].to_i
        @price = @array[-1].to_f
        @array.delete_at(0)
        @array.delete_at(-1)
        @good = @array.join(' ').sub!(' at', '')
        @imported = @good.include?('imported')
    end
end

# Print test data
input_one = SalesTax.new
items = './data/input_one.txt'
input_one.print_receipt(items)

puts '-'*10

input_two = SalesTax.new
items = './data/input_two.txt'
input_two.print_receipt(items)

puts '-'*10

input_three = SalesTax.new
items = './data/input_three.txt'
input_three.print_receipt(items)

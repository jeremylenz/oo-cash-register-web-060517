require 'pry'
class CashRegister

attr_accessor :total
attr_reader :discount, :items

@last_item = {}

def initialize(emp_discount=0)
  @total = 0.0
  @discount = emp_discount
  @items = []
end

def total
  @total
end

def add_item(title, price, qty=1)
  @total += (price * qty)
  qty.times do
    @items << title
  end
  @last_item = {name: title, price: price, qty: qty}
end

def apply_discount
  # binding.pry
  return "There is no discount to apply." if @discount == 0

  @total *= (1.0 - (@discount / 100.0))
  "After the discount, the total comes to $#{total.to_i}."
end

def void_last_transaction

  @last_item[:qty].times do
    @total -= @last_item[:price]
  end
  "#{@last_item[:name]} removed from cart."
  
end



end #of Class

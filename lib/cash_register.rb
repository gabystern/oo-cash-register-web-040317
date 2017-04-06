require 'pry'

class CashRegister

  attr_accessor :title, :price, :discount, :total, :items, :prices

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def self.total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    quantity.times do @items << title
    end
    last_transaction = price*quantity
    @prices << last_transaction
    @total
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total *= ((100-discount)*0.01)
      @total = @total.to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @prices.pop
  end

end

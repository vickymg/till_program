class Till

  require_relative 'menu'

  attr_reader :total_order, :prices

  TAX_PERCENTAGE = 5

  def initialize(menu = Menu.new)
    @total_order = []
    @prices = menu.prices
  end

  def place_order(item)
    item.split(", ").each do |item|
      @order = @prices.select { |k, v| item.include? k }
      @total_order << @order
    end
    @total_order
  end

  def print_receipt
    @total_order.each do |item|
      item.each {|choice, price| puts "#{choice}: 1 x #{'%.2f' % price}\n"}
    end
    puts "Tax: #{'%.2f' % calculate_tax}"
    puts "Total: #{'%.2f' % (@total + @tax)}"
  end

  private

  def calculate_tax
    total_cost
    @tax = (@total*TAX_PERCENTAGE/100).round(2)
  end

  def total_cost
    @total = 0
    @total_order.each { |item| item.each {|choice, price| @total += price } }
  end

end

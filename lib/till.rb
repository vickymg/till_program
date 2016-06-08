class Till

  require 'json'

  attr_reader :order, :menu

  MENU = File.read('coffeeshop.json')

  def initialize(menu = MENU)
    @order = {}
    @menu = JSON.parse(menu)
  end

  def place_order(item)
    item.split(", ").each do |item|
      @order[item] = @menu["prices"][0][item]
    end
    @order
  end

  def print_receipt
    @order.each do |item, price|
      print "#{item}: #{price}"
    end
  end

end

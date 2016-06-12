class Till

  require 'json'

  attr_reader :total_order, :menu

  MENU = File.read('coffeeshop.json')

  def initialize(menu = MENU)
    @total_order = []
    @menu = JSON.parse(menu)
  end

  def place_order(item)
    item.split(", ").each do |item|
      @order = @menu["prices"][0].select { |k, v| item.include? k }
      @total_order << @order
    end
    @total_order
  end

  def print_receipt
    @total_order.each {|item|
      item.each {|choice, price| print "#{choice}: 1 x #{'%.2f' % price}\n"}
    }
  end

end

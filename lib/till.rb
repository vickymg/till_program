class Till

  require 'json'

  attr_reader :order, :menu

  MENU = File.read('coffeeshop.json')

  def initialize(menu = MENU)
    @order = {}
    @menu = JSON.parse(menu)
  end

  def place_order(item)
    
  end

end

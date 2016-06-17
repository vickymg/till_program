class Menu

  require 'json'

  attr_reader :cafe

  CAFE = File.read('coffeeshop.json')

  def initialize(cafe = CAFE)
    @cafe = JSON.parse(cafe)
  end

end

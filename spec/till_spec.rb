require 'till'

describe Till do

  test_menu = File.read('./spec/testCafe.json')
  subject(:till) { described_class.new(menu = test_menu) }

  it 'initializes with an empty order' do
    expect(till.order).to eq({})
  end

  it 'should parse a json file containing coffee shop details and items' do
    expect(till.menu).to eq(JSON.parse(test_menu))
  end

  describe '#place_order' do

    it 'has a place order method that can be passed items' do
      expect(till).to respond_to(:place_order).with(1).argument
    end

  end

end

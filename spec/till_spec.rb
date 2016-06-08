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

    it 'returns the correct price when passed an item' do
      expect(till.place_order('Cappuccino')).to eq(2.75)
    end

  end

  describe '#print_receipt' do

    before do
      till.place_order('Cappuccino')
    end

    it 'returns the item ordered plus price to stdout' do
      expect{till.print_receipt}.to output("Cappuccino: 2.75").to_stdout
    end

  end

end

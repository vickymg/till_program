require 'till'

describe Till do

  test_menu = File.read('./spec/testCafe.json')
  subject(:till) { described_class.new(menu = test_menu) }

  it 'initializes with an empty order' do
    expect(till.total_order).to eq([])
  end

  it 'should parse a json file containing coffee shop details and items' do
    expect(till.menu).to eq(JSON.parse(test_menu))
  end

  describe '#place_order' do

    it 'has a place order method that can be passed items' do
      expect(till).to respond_to(:place_order).with(1).argument
    end

    it 'adds the item plus price to the order' do
      till.place_order('Cappuccino')
      expect(till.total_order).to eq([{"Cappuccino" => 2.75}])
    end

    it 'adds multiple items plus prices to the order' do
      expect(till.place_order('Cappuccino, Flat White')).to eq([{
        "Cappuccino" => 2.75},
        {"Flat White" => 2.50
        }])
    end
  end

  describe '#print_receipt' do

    before do
      till.place_order('Cappuccino, Flat White')
    end

    it 'returns the item ordered plus, quantity and price to stdout' do
      text = "Cappuccino: 1 x 2.75\nFlat White: 1 x 2.50\n"
      expect{till.print_receipt}.to output(text).to_stdout
    end
  end

  describe '#total_cost' do

    before do
      till.place_order('Cappuccino, Flat White')
    end

    it 'returns the total cost of items ordered' do
      expect(till.total_cost).to eq(5.25)
    end
  end

end

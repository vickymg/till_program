require 'till'

describe Till do

  test_cafe = File.read('./spec/testCafe.json')
  parsed_menu = JSON.parse(test_cafe)
  let(:menu) { double :menu }
  subject(:till) { described_class.new(menu) }

  before do
    allow(menu).to receive(:cafe).and_return(parsed_menu)
  end

  it 'initializes with an empty order' do
    expect(till.total_order).to eq([])
  end

  it 'initializes with a new menu' do
    expect(till.menu).to eq(parsed_menu)
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

  context 'order has been placed' do

    before do
      till.place_order('Cappuccino, Flat White')
    end

    describe '#print_receipt' do
      it 'returns the item ordered plus, quantity and price to stdout' do
        text = "Cappuccino: 1 x 2.75\nFlat White: 1 x 2.50\nTax: 0.26\nTotal: 5.51\n"
        expect{till.print_receipt}.to output(text).to_stdout
      end
    end
  end

end

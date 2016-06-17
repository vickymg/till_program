require 'menu'

describe Menu do

  test_cafe = File.read('./spec/testCafe.json')
  parsed_cafe = JSON.parse(test_cafe)
  subject(:menu) { described_class.new(cafe = test_cafe) }

  it 'should parse a json file containing coffee shop details and items' do
    expect(menu.cafe).to eq(parsed_cafe)
  end

  describe '#prices' do
    it 'should return the price list' do
      expect(menu.prices).to eq(parsed_cafe['prices'][0])
    end
  end

end

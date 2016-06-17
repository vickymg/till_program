require 'menu'

describe Menu do

  test_cafe = File.read('./spec/testCafe.json')
  subject(:menu) { described_class.new(cafe = test_cafe) }

  it 'should parse a json file containing coffee shop details and items' do
    expect(menu.cafe).to eq(JSON.parse(test_cafe))
  end

end

require 'till.rb'

describe Till do

  subject(:till) { described_class.new }

  it 'initializes with an empty order' do
    expect(till.order).to eq({})
  end

end

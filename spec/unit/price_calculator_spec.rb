require 'price_calculator'

describe Price_Calculator do

  subject(:price_calculator) { described_class.new }
  let(:order) { double :order }
  let(:large_express_order) { double :order }

  before do
    allow(order).to receive(:express_deliveries).and_return(1)
    allow(order).to receive(:standard_deliveries).and_return(3)
    allow(large_express_order).to receive(:express_deliveries).and_return(2)
    allow(large_express_order).to receive(:standard_deliveries).and_return(0)
  end

  describe '#return_cost' do
    it 'returns the cost of the order' do
      expect(price_calculator.return_cost(order)).to eq ((3 * Price_Calculator::STANDARD_COST + 1 * Price_Calculator::EXPRESS_COST)* 0.9)
    end

    it 'applies a discount for large order' do
      expect(price_calculator.return_cost(order)).not_to eq (3 * Price_Calculator::STANDARD_COST + 1 * Price_Calculator::EXPRESS_COST)
    end

    it 'applies a discount for large express orders' do
      expect(price_calculator.return_cost(large_express_order)).to eq (2 * Price_Calculator::EXPRESS_COST_DISCOUNTED)
      expect(price_calculator.return_cost(large_express_order)).not_to eq (2 * Price_Calculator::EXPRESS_COST)
    end

    it 'does not applies a discount on a total cost of an order inferior or equal to 30' do
      expect(price_calculator.return_cost(large_express_order)).not_to eq (2 * Price_Calculator::EXPRESS_COST_DISCOUNTED) * 0.9
    end
  end


end

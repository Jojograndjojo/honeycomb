require 'order'
require 'price_calculator'

describe 'feature' do
  order = Order.new('WNP/SWCL001/010')
  price_calculator = Price_Calculator.new

  it 'applies the correct discount to an order' do
    order.send_standard_delivery('Disney')
    order.send_standard_delivery('Discovery')
    order.send_standard_delivery('Viacom')
    order.send_express_delivery('Horse and Country')
    expect(price_calculator.return_cost(order)).to eq ((3 * Price_Calculator::STANDARD_COST + 1 * Price_Calculator::EXPRESS_COST)* 0.9)
  end
end

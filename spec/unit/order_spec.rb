require 'order'

describe Order do

  subject(:order) { described_class.new('WNP/SWCL001/010') }

  describe '#reference' do
    it 'has a reference in the form of a string' do
      expect(order.reference).to respond_to(:capitalize)
    end
  end

  describe '#send_standard_delivery' do
    it 'stores standard deliveries' do
      expect { order.send_standard_delivery('Disney') }.to change{order.standard_deliveries}.by(1)
    end
  end

  describe '#send_express_delivery' do
    it 'stores express deliveries' do
      expect { order.send_express_delivery('Viacom') }.to change{order.express_deliveries}.by(1)  
    end
  end

end

class Order

  attr_reader :reference, :standard_deliveries, :express_deliveries

  def initialize(reference)
    @reference = reference
    @standard_deliveries = 0
    @express_deliveries = 0
  end

  def send_standard_delivery(broadcaster)
    @standard_deliveries += 1
  end

  def send_express_delivery(broadcaster)
    @express_deliveries += 1
  end

end

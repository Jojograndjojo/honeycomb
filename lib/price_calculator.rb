class Price_Calculator

  STANDARD_COST = 10

  EXPRESS_COST = 20
  EXPRESS_COST_DISCOUNTED = 15
  LARGE_EXPRESS_ORDER = 2

  LARGE_ORDER = 30
  LARGE_ORDER_DISCOUNT = 0.1

  def return_cost(order)
    total_cost = (calculate_express_cost(order) + calculate_standard_cost(order))
    total_cost > LARGE_ORDER ? total_cost * (1 - LARGE_ORDER_DISCOUNT) : total_cost
  end

  private

  def calculate_standard_cost(order)
    order.standard_deliveries * STANDARD_COST
  end

  def calculate_express_cost(order)
    order.express_deliveries >= LARGE_EXPRESS_ORDER ? order.express_deliveries * EXPRESS_COST_DISCOUNTED : order.express_deliveries * EXPRESS_COST
  end

end

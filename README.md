# Honeycomb Engineering Test

## Running the application

An application written in Ruby, to calculate the cost of deliveries.

The application, can be run from the command line, in a ruby environment (assuming that you are in the application directory).  

As an example we can send the order ref WNP/SWCL001/010 to Disney, Discovery, Viacom via Standard Delivery and Horse and Country via Express Delivery :


```
require './lib/order'
require './lib/price_calculator'

order = Order.new('WNP/SWCL001/010')
price_calculator = Price_Calculator.new

order.send_standard_delivery('Disney')
order.send_standard_delivery('Discovery')
order.send_standard_delivery('Viacom')
order.send_express_delivery('Horse and Country')
price_calculator.return_cost(order)

```
45 will then be outputted in the command line.

## Design

To build this application, the choice was made of having two classes

- The Order class  
It understands tracking different types of deliveries  

The name of the broadcasters are used for orders to be sent, to facilitate the use of the feature. However as the application is currently built, the orders in themselves are not being recorded.

- The Price_Calculator class  
It understands the financial value of an order

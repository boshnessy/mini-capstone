require 'unirest'

# response = Unirest.get("http://localhost:3000/v2/all-products")

# p "Here are your products:"
# puts JSON.pretty_generate(response.body)


# p "Please select the page you would like to view:"

# p "[1] All the products"
# p "[2] One of the products"

# user_input = gets.chomp

# base_url = "http://localhost:3000/v2"

# if user_input == "1"
#   response = Unirest.get("#{base_url}/all-products")
# elsif user_input == "2"
#   response = Unirest.get("#{base_url}/bike")
# end


# p "enter the name of your product"
# name = gets.chomp
# p "enter the price of your product"
# price = gets.chomp
# p "enter the description of your product"
# description = gets.chomp
# p "is your product in stock?"
# in_stock = gets.chomp

# response = Unirest.post("http://localhost:3000/v4/products/", parameters: {
#   input_name: name,
#   input_price: price,
#   input_description: description,
#   input_in_stock: in_stock
#   })

# puts JSON.pretty_generate(response.body)


p "enter the id of the product you would like to update"
product_id = gets.chomp
p "enter the name of your product"
name = gets.chomp
p "enter the price of your product"
price = gets.chomp
p "enter the description of your product"
description = gets.chomp
p "is your product in stock?"
in_stock = gets.chomp

response = Unirest.patch("http://localhost:3000/v4/products/#{product_id}", parameters: {
  input_name: name,
  input_price: price,
  input_description: description,
  input_in_stock: in_stock
})

products = response.body

puts "Congrats, you successfully updated your product."
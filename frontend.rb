require 'unirest'

# p "Would you like to search by name or by price?"
# p "[1] name"
# p "[2] price"
# user_input = gets.chomp

# if user_input == "1"
#   p "What would you like to search for?"
#   search_term = gets.chomp
#   response = Unirest.get("http://localhost:3000/v4/products?search=#{search_term}")
#   p response.body
# elsif user_input == "2"
#   p "Search for any items priced greater than:"
#   search_term = gets.chomp
#   response = Unirest.get("http://localhost:3000/v4/products?sort_price=#{search_term}")
#   p response.body
# end


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


# p "enter the id of the product you would like to update"
# product_id = gets.chomp
# p "enter the name of your product"
# name = gets.chomp
# p "enter the price of your product"
# price = gets.chomp
# p "enter the description of your product"
# description = gets.chomp
# p "is your product in stock?"
# in_stock = gets.chomp

# response = Unirest.patch("http://localhost:3000/v4/products/#{product_id}", parameters: {
#   input_name: name,
#   input_price: price,
#   input_description: description,
#   input_in_stock: in_stock
# })

# products = response.body

# puts JSON.pretty_generate(response.body)

# USER CREATE
response = Unirest.post("localhost:3000/v4/users", parameters: 
  {
    name: "Jordan",
    email: "jordan@gmail.com",
    password: "password",
    password_confirmation: "password"
  }
)

p response.body
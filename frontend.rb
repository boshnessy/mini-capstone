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


response = Unirest.post("http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "becca@gmail.com",
      password: "password"
    }
  }
)
p response.body
jwt = response.body["jwt"]
Unirest.default_header("Authorization", "Bearer #{jwt}")


response = Unirest.post("http://localhost:3000/v4/products/", parameters: {
  name: "idk",
  price: 40
  })

p response.body

# while true
#   p "What do you want to do?"
#   p "[1] Log in"
#   p "[2] Create an order"
#   p "[3] See your orders"
#   p "[4] Create a product"
#   p "[5] Sign up"
#   p "[6] Log out"
#   user_input = gets.chomp

#   # LOGIN
#   if user_input == "1"
#     p "Enter your email"
#     email = gets.chomp
#     p "Enter your password"
#     password = gets.chomp

#     response = Unirest.post(
#       "http://localhost:3000/user_token",
#       parameters: {
#         auth: {
#           email: email,
#           password: password
#         }
#       }
#     )
#     p response.body
#     jwt = response.body["jwt"]
#     Unirest.default_header("Authorization", "Bearer #{jwt}")

#   elsif user_input == "2"
#   # CREATE AN ORDER
#     p "What is the id of the product you wish to order?"
#     product_id = gets.chomp
#     p "How many do you want to buy?"
#     quantity = gets.chomp

#     response = Unirest.post("localhost:3000/v4/orders", parameters: {
#         product_id: product_id,
#         quantity: quantity
#       }
#     )
#     p response.body

#   elsif user_input == "3"
#     response = Unirest.get("localhost:3000/v4/orders")
#     p response.body

#   elsif user_input == "4"
#     p "enter the name of your product"
#     name = gets.chomp
#     p "enter the price of your product"
#     price = gets.chomp
#     p "enter the description of your product"
#     description = gets.chomp
#     p "is your product in stock?"
#     in_stock = gets.chomp

#     response = Unirest.post("http://localhost:3000/v4/products/", parameters: {
#       input_name: name,
#       input_price: price,
#       input_description: description,
#       input_in_stock: in_stock
#       }
#     )

#     puts JSON.pretty_generate(response.body)

#   elsif user_input == "5"
#     # USER CREATE
#     p "Enter your name"
#     name = gets.chomp
#     p "Enter your email"
#     email = gets.chomp
#     p "Enter your password"
#     password = gets.chomp
#     p "Enter your password again"
#     password_confirmation = gets.chomp

#     response = Unirest.post("localhost:3000/v4/users", parameters: 
#       {
#         name: name,
#         email: email,
#         password: password,
#         password_confirmation: password_confirmation
#       }
#     )

#     p response.body
#   elsif user_input == "6"
#     # LOGOUT
#     jwt = ""
#     Unirest.clear_default_headers()
#     break
#   end
# end
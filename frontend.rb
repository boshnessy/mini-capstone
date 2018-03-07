require 'unirest'

response = Unirest.get("http://localhost:3000/all_products")

p "Here are your products:"
p response.body
class V3::ProductsController < ApplicationController

# create a single route that can display ANY single product using a query parameter.
# create a single route that can display ANY single product using a url segment parameter.
# hint: item = ModelName.find_by(attribute_1: “some value”)

  def query_product
    # get user input
    user_input = params[:id]
    # based on user input, find product in db
    productx = Product.find_by(id: user_input)
    # show that product to user
    render json: productx.as_json
  end

  def show_products
    products = Product.all
    product_hashes = []

    products.each do |product|
      product_hashes << {name: product.name, price: product.price, image: product.image_url, description: product.description}
    end

    render json: product_hashes
  end

  def bike
    bike = Product.first
    render json: bike.as_json
  end

  def skateboard
    skateboard = Product.second
    render json: {name: skateboard.name, price: skateboard.price, image: skateboard.image_url, description: skateboard.description}
  end

  def scooter
    scooter = Product.find_by(name: "Scooter")
    render json: scooter.as_json
  end

end
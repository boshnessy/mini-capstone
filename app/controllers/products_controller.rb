class ProductsController < ApplicationController

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
    scooter = Product.last
    render json: scooter.as_json
  end

end

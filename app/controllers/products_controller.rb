class ProductsController < ApplicationController
  def transportation_products
    product1 = Product.first

    render json: product1.as_json
  end

  def show_products
    products = Product.all
    product_hashes = []

    products.each do |product|
      product_hashes << {name: product.name, price: product.price, image: product.image_url, description: product.description}
    end

    render json: product_hashes
  end
end

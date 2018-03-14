class V4::ProductsController < ApplicationController

  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    id = params[:id]
    products = Product.find_by(id: id)
    render json: products.as_json
  end

  def create
    product1 = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
      in_stock: params[:input_in_stock]
      )
    product1.save
    render json: product1.as_json
  end

  def update
    id = params[:id]
    product = Product.find_by(id: id)
    product.update(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
      in_stock: params[:input_in_stock]
    )
  end

end
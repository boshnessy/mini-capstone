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

end
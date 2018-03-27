class V4::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      render json: []
    end
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    # inputs: carted_products
    # outputs: all the items and their prices and their quantities all added up together
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if order.save
      carted_products.update_all(status: "purchased", order_id: order.id)
      render json: order.as_json # {message: "Order created successfully"}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessible_entity
    end
  end
  # def create
  #   carted_products = CartedProduct.where(status: "carted")

  #   product = Product.find_by(id: params[:product_id])
  #   calculated_subtotal = params[:quantity].to_i * product.price
  #   tax_rate = 0.09
  #   calculated_tax = calculated_subtotal * tax_rate
  #   calculated_total = calculated_subtotal + calculated_tax

  #   order = Order.new(
  #     user_id: current_user.id,
  #     # product_id: params[:product_id],
  #     # quantity: params[:quantity],
  #     subtotal: calculated_subtotal,
  #     tax: calculated_tax,
  #     total: calculated_total
  #   )

  #   if order.save
  #     render json: order.as_json # {message: "Order created successfully"}, status: :created
  #   else
  #     render json: {errors: order.errors.full_messages}, status: :unprocessible_entity
  #   end
  # end
end
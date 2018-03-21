class V4::OrdersController < ApplicationController
  def index
    if current_user
      orders = current_user.orders
      render json: orders.as_json
    else
      render json: []
    end
  end

  def create
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    if order.save
      render json: order.as_json # {message: "Order created successfully"}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessible_entity
    end
  end
end
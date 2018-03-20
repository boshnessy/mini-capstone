class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id,
      product_id,
      quantity,
      subtotal,
      tax,
      total
    )

    order.save
  end
end

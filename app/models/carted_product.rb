class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :order, optional: true

  def as_json
    {
      id: id,
      status: status,
      user_id: user_id,
      product_id: product_id,
      quantity: quantity
    }
  end
end
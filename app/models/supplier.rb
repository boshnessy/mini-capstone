class Supplier < ApplicationRecord
  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone_number: phone_number
    }
  end

  def products
    Product.where(supplier_id: id)
  end
end

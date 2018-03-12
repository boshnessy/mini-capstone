class Product < ApplicationRecord
  def as_json
    {
      id: id,
      name: name,
      price: price,
      tax: tax,
      total: total,
      image: image_url,
      description: description,
      discount: is_discounted
    }
  end 

  def is_discounted

    if price < 2
      return true
    else
      return false
    end
  
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end

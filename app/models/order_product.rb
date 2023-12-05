class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # fields: order_id, product_id
end
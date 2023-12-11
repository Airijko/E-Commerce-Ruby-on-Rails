class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :order, :product, presence: true
  # fields: order_id, product_id
end
class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  # fields: product_id, name, description, price, stock_quantity, brand
end
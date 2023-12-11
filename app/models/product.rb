class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  belongs_to :category
  has_one_attached :image

  validates :name, :description, :price, :stock_quantity, :brand, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 255 }
  validates :brand, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
  # fields: product_id, name, description, price, stock_quantity, brand
end
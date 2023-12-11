class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, length: { maximum: 50 }
  # fields: category_id, name
end
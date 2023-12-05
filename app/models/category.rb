class Category < ApplicationRecord
  has_many :products
  # fields: category_id, name
end
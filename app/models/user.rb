class User < ApplicationRecord
  has_many :orders
  # fields: username, email, password, phone, address, role
end
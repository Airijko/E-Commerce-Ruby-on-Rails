class User < ApplicationRecord
  has_many :orders

  validates :username, :email, :password, :phone, :address, :role, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: { in: 4..12 }
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d{10}\z/, message: "must be 10 digits long" }
  validates :role, inclusion: { in: %w(admin user), message: "%{value} is not a valid role" }
  # fields: username, email, password, phone, address, role
end
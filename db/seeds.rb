Product.delete_all

electronics = [
  'Smartphone',
  'Laptop',
  'Tablet',
  'Headphones',
  'Camera',
  'Smartwatch',
  'Drone',
  'Bluetooth Speaker',
  'Game Console',
  'TV'
]

electronics.each do |product_name|
  product = Product.create(
    name: product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 0..500.00, as_string: true),
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    brand: Faker::Company.name,
    image: product_name + ".jpg"
  )

  if product.persisted?
    puts "Product #{product.name} was created successfully."
  else
    puts "Failed to create product. Errors: #{product.errors.full_messages.join(", ")}"
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
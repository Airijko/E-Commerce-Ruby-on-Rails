# Product.delete_all

categories = [
  'Smartphones & Accessories',
  'Computers & Tablets',
  'Cameras, Photo & Video',
  'Headphones & Audio',
  'TVs & Home Theater',
  'Smart Home & Networking',
  'Drones & Tech Toys',
  'Wearable Technology',
  'Gaming Consoles & Accessories',
  'Office Electronics'
]

categories.each do |category_name|
  Category.create(name: category_name)
end

electronics = [
  'Smartphone',
  'Laptop',
  'Tablet',
  'Headphones',
  'Camera',
  'Smartwatch',
  'Drone',
  'Speaker',
  'Console',
  'TV'
]

8.times do
  electronics.each do |product_name|
    product = Product.new(
    name: product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 0..500.00, as_string: true),
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    brand: Faker::Company.name,
    category_id: Faker::Number.between(from: 1, to: 10),
    on_sale: Faker::Boolean.boolean
    )

    if product.valid?
      downloaded_image = URI.open("https://source.unsplash.com/random/?#{product_name}-product")
      product.image.attach(io: downloaded_image, filename: "m-#{product_name}.jpg")
      product.save
      puts "Product #{product.name} was created successfully."
    else
      puts "Failed to create product: #{product_name}"
      puts product.errors.full_messages
    end
  end
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end
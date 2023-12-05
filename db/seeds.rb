Product.delete_all

10.times do
  product_name = Faker::Commerce.product_name
  product = Product.create(
    name: product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 0..100.0, as_string: true),
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    brand: Faker::Company.name,
    image: "#{product_name.parameterize}.jpg"
  )

  if product.persisted?
    puts "Product #{product.name} was created successfully."
  else
    puts "Failed to create product. Errors: #{product.errors.full_messages.join(", ")}"
  end
end


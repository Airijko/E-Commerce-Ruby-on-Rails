10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Commerce.price(range: 0..100.0, as_string: true),
    stock_quantity: Faker::Number.between(from: 1, to: 100),
    brand: Faker::Company.name,
    category_id: Faker::Number.between(from: 1, to: 10)
  )
end

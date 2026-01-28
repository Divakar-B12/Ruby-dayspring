# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Product.create(
#   name: "Google Pixel 10 Pro",
#   description: "Google Pixel 10 Pro featuring Tensor G5 chip, advanced AI photography, 50MP triple camera setup, 6.7-inch LTPO OLED display, and seamless Google ecosystem integration.",
#   price: 1099.00,
#   stock: 25,
#   is_active: true
# )

# Product.create([{ name: "Apple iPhone 15 Pro Max", description: "Apple iPhone 15 Pro Max with A17 Pro chip, ProMotion display, advanced camera system, and titanium design.", price: 1199.00, stock: 30, is_active: true
# }, {
#   name: "Samsung Galaxy S24 Ultra", description: "Samsung Galaxy S24 Ultra featuring Snapdragon 8 Gen 3, 200MP quad-camera system, 6.8-inch Dynamic AMOLED display, and S Pen support.", price: 1299.00, stock: 20, is_active: true }
# ])
# Product.create(
#   name: Faker::Commerce.product_name,
#   description: "The latest smartphone with cutting-edge features and sleek design.",
#   price: Faker::Commerce.price(range: 300.0..1500.0),
#   stock: rand(1..100),
#   is_active: [true, false].sample
# )


Product.create(
  name: "Samsung Galaxy S25 Ultra",
  description: "Samsung Galaxy S25 Ultra powered by Snapdragon 8 Gen 4, featuring a 200MP quad-camera system, 6.9-inch Dynamic AMOLED 2X display, S-Pen support, massive battery life, and premium titanium build for flagship performance.",
  price: 1249.00,
  stock: 30,
  is_active: false
)

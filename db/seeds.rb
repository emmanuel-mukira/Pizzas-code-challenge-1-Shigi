# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
 puts 'Started seeding'
# Create Restaurants
restaurants = []
3.times do
  restaurants << Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address
  )
end

# Create Pizzas
pizzas = []
2.times do
  pizzas << Pizza.create(
    name: Faker::Food.dish,
    ingredients: Faker::Food.description
  )
end

# Create RestaurantPizzas
restaurants.each do |restaurant|
  pizzas.each do |pizza|
    RestaurantPizza.create(
      price: Faker::Number.between(from: 1, to: 30),
      restaurant: restaurant,
      pizza: pizza
    )
  end
end

puts'Finished seeding to unseed run "rails db:reset"'

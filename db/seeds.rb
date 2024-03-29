# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  generic_name = Faker::StarWars.planet
  apis = [generic_name, "ff#{Faker::StarWars.planet.downcase}", Faker::StarWars.planet].uniq.join(', ')
  price = [1399, 1200, 1600, 5000].sample
  Med.create(brand_name: Faker::StarWars.specie, generic_name: generic_name, apis: apis, price_cents: price)
end

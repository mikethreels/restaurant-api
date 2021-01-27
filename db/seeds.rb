# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Store.create!(name: 'tostitos', location: 'Krakow', email: 'restaurant@test.com')
Store.create!(name: 'rabarbar', location: 'Amsterdam', email: 'restaurant@test.com')
Store.create!(name: 'moomoos', location: 'Paris', email: 'restaurant@test.com')
Menu.create!(items: {breakfast: [['full enlish', '15 euros'], 
                                ['baguette', '2 euros']], lunch: [['burittos', '7 euros']], 
                                diner:[['meatloaf', '20 euros']], 
                                drinks:[['choclate milk', '1 euro']]}, store_id: 1)
Menu.create!(items: {breakfast: [['pancakes', '15 euros'], 
                                ['croisant', '2 euros']], lunch: [['apple pie', '7 euros']], 
                                diner:[['steak', '20 euros']], 
                                drinks:[['water', '1 euro']]}, store_id: 2)
Menu.create!(items: {breakfast: [['yoghurt', '15 euros'], 
                                ['pudding', '2 euros']], lunch: [['tacos', '7 euros']], 
                                diner:[['salad', '20 euros']], 
                                drinks:[['orange juice', '1 euro']]}, store_id: 3)
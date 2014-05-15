# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities =  City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Appetizers','Salads','Entrees','Desserts'].each do |c|
  Category.create title:c
end

Item.create title: 'Cheeseburger', photo:"http://geminiindustries.com/media/catalog/product/cache/2/thumbnail/256x/5e06319eda06f020e43594a9c230972d/k/t/kt18555-cheeseburger---graphic.png", description: 'Lorem Ipsum', category: Category.find_by_title('Entrees'), price: 10
Item.create title: 'Cobb Salad', photo:'http://mda.bigoven.com/pics/rs/256/original-cobb-salad-brown-derby-6.jpg', description: 'Lorem Ipsum', category: Category.find_by_title('Salads'), price: 10
Item.create title: 'Shrimp Cocktail',photo:'http://mda.bigoven.com/pics/rs/256/mexican-shrimp-cocktail-coctel-de-c.jpg',description: 'Lorem Ipsum', category: Category.find_by_title('Appetizers'), price: 5
Item.create title: 'Cheesecake', photo:'http://4.bp.blogspot.com/_2h7XhASzl0U/Su-zekAwjLI/AAAAAAAAB9E/j3zDVAf4BpA/s320/New+York+Style+Cheesecake.jpg', description: 'Lorem Ipsum', category: Category.find_by_title('Desserts'), price: 10

User.create name: 'Shankar Poncelet', email: 'shankx@mac.com', password: 'pass', password_confirmation: 'pass', admin: true
User.create name: 'Test User', email: 'test@test.com', password: 'pass', password_confirmation: 'pass', admin: false

Order.create items: [Item.find_by_title('Cheeseburger'), Item.find_by_title('Cheesecake')], user: User.find_by_email('shankx@mac.com')
Order.create items: [Item.find_by_title('Cheeseburger'), Item.find_by_title('Cheesecake')], user: User.find_by_email('test@test.com')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Appetizers','Salads','Entrees','Desserts'].each do |c|
  Category.create title:c
end

Item.create title: 'Cheeseburger', description: 'A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty, but the burger can include many variations in structure, ingredients, and composition.', category: Category.find_by_title('Entrees'), price: 9
Item.create title: 'Wedge Salad', description: 'One of our most famous salads, a quarter of a head of lettuce drizzled with a balsamic reduction, bacon and bleu cheese crumbled with your choice of dressing.', category: Category.find_by_title('Salads'), price: 13
Item.create title: 'Bloomin Onion', description: 'A bloomin onion is a dish consisting of one large onion which is cut to resemble a flower, battered and deep-fried. It is served as an appetizer at some restaurants.', category: Category.find_by_title('Appetizers'), price: 8
Item.create title: 'Cheesecake', description: 'Carrot cake is a cake which contains carrots mixed into the batter. The carrot softens in the cooking process, and the cake usually has a soft, dense texture.', category: Category.find_by_title('Desserts'), price: 7

User.create name: 'Jesse Kraft', email: 'kraftjl2@gmail.com', password: 'pass', password_confirmation: 'pass', admin: true
User.create name: 'Test User', email: 'test@test.com', password: 'pass', password_confirmation: 'pass', admin: false

Order.create items: [Item.find_by_title('Cheeseburger'), Item.find_by_title('Cheesecake')], user: User.find_by_email('kraftjl2@gmail.com')
Order.create items: [Item.find_by_title('Cheeseburger'), Item.find_by_title('Cheesecake')], user: User.find_by_email('test@test.com')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '**** Creating Seed data ****'
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
product1 = Product.create!(title: 'Iphone', description: 'Apple Innovation', start_date: '2017-05-16', end_date: '2017-08-21')
RatePlan.create!(title: 'ATT Next', description: 'ATT Next Plan', start_date: '2017-08-02', end_date: '2017-08-19', product_id: product1.id, recurrence: 'onetime', price: 500)
RatePlan.create!(title: 'ATT Super', description: 'ATT Next Super Plan', start_date: '2017-05-12', end_date: '2017-08-19', product_id: product1.id, recurrence: 'monthly', price: 126)
Product.create!(title: 'Samsung', description: 'Android', start_date: '2017-05-16', end_date: '2017-08-19')
puts '**** Seed data Completed!! ****'

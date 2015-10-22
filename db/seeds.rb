# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

user = User.where(email: "hakuyang@gmail.com").first
unless user
    user = User.new(email: "hakuyang@gmail.com", password: "password")
    user.skip_confirmation!
    user.save!
end

20.times do
    Item.create!(
        user: user,
        name: Faker::Lorem.sentence
        )
end
items = Item.count

puts "Seed Finished"
puts "#{Item.count} items created"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  email: "admin@admin.com",
  password: "admin123",
  password_confirmation: "admin123",
  name: 'Admin'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: "user1@user.com",
  password: "password",
  password_confirmation: "password",
  name: 'User 1'
)
user.skip_confirmation!
user.save!

user = User.new(
  email: "user2@user.com",
  password: "password",
  password_confirmation: "password",
  name: 'User 2'
)
user.skip_confirmation!
user.save!
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(
    :email => "test@gmail.com",
    :password => "test1234",
    :phone => "5555551230",
    :first_name => "John",
    :last_name => "Test",
    :admin => true
  ).save!

User.new(
    :email => "test1@gmail.com",
    :password => "test1234",
    :phone => "5555551231",
    :first_name => "Jane",
    :last_name => "Test"
  ).save!

User.new(
    :email => "test2@gmail.com",
    :password => "test1234",
    :phone => "5555551232",
    :first_name => "Jake",
    :last_name => "Test"
  ).save!

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  Skill.create(name: Faker::Company.buzzword)
end

1000.times do
  User.create({
    email: Faker::Internet.email,
    password: 'prueba123',
    password_confirmation: 'prueba123',
    worker_attributes: {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number,
      skills: Skill.all.sample(rand(10).succ),
      latitude: Faker::Number.decimal(2, 7).to_f % 2 + 51,
      longitude: Faker::Number.decimal(2, 7).to_f % 3 + 4
    }
  })
end

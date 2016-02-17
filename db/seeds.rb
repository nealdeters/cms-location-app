# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 10.times do
#   Image.create!(
#     business_name: Faker::Company.name,
#     address_1: Faker::Address.street_address,
#     address_2: Faker::Address.secondary_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zipcode: Faker::Address.zip_code,
#     phone_number: Faker::PhoneNumber.cell_phone,
#     business_description: Faker::Lorem.paragraph(2),
#     service_description: Faker::Lorem.paragraph,
#     brand_id: 14,
#   )
# end

# @imageable_type = ["Brand", "Location", "Content"]

# 10.times do
#   Image.create!(
#     imageable_id: Faker::Number.between(1, 100),
#     imageable_type: @imageable_type.sample,
#     image_name: Faker::App.name,
#     image_category: Faker::Lorem.word,
#     image_path: Faker::Avatar.image("kitten mittens", "300x300") 
#   )
# end

# @contentable_type = ["Brand", "Location"]

# 10.times do
#   Content.create!(
#     contentable_id: Faker::Number.between(1, 100),
#     contentable_type: @contentable_type.sample,
#     content_name: Faker::App.name,
#     content_category: Faker::Lorem.word,
#     content_field: Faker::Lorem.paragraph(2)
#   )
# end

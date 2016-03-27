# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurants = Category.create!(name: "Restaurants")
education = Category.create!(name: "Education")
nightlife = Category.create!(name: "Nightlife")

mack = Company.create!(
    name: "Mack Bar-B-Que",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
    )
bastione = Company.create!(
    name: "Al Bastione",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
)
davinci = Company.create!(
    name: "Da Vinci Pasta and Pizza",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
)
attimo = Company.create!(
    name: "Attimo",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
)
cookie = Company.create!(
    name: "Cookie Cafe",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
)
shakedown = Company.create!(
    name: "ShakeDown Restaurant",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: restaurants
)
harvad = Company.create!(
    name: "Harvard",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: education
)
columbus = Company.create!(
    name: "Columbus",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: education
)
hollywood = Company.create!(
    name: "Club Hollywood",
    description: Faker::Lorem.paragraph(3),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.zip_code,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.safe_email,
    website_url: Faker::Internet.url,
    small_cover_url: "gallery-#{(1..8).to_a.sample}",
    large_cover_url: "gallery-#{(1..8).to_a.sample}",
    logo_url: "logo-#{(1..10).to_a.sample}",
    category: nightlife
)

user = User.create!(first_name: "John", last_name: "Smith", email: "john@example.com", password: "test")
Review.create!(content: Faker::Lorem.paragraph(3), user: user, company: hollywood)
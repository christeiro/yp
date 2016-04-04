Fabricator(:company) do
  name { Faker::Lorem.words(2) }
  description { Faker::Lorem.paragraph(3) }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  zipcode { Faker::Address.zip_code }
  country { Faker::Address.country }
  phone { Faker::PhoneNumber.phone_number }
  email { Faker::Internet.safe_email }
  website_url { Faker::Internet.url }
  small_cover_url { "gallery-#{(1..8).to_a.sample}" }
  large_cover_url { "gallery-#{(1..8).to_a.sample}" }
  logo_url { "logo-#{(1..10).to_a.sample}" }
  category { Fabricate(:category) }
end
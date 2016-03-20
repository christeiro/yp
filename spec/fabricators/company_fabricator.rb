Fabricator(:company) do
  name { Faker::Lorem.words(2) }
  category { Fabricate(:category) }
end
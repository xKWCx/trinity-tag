FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    website { Faker::Internet.url }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end

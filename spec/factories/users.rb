FactoryBot.define do
  factory :user do
    organization
    first_name { "John" }
    last_name { "Doe" }
    email { "user@example.com" }
    phone { "+1 555-123-4567" }
    role { :user }
    password { "password123" }
    password_confirmation { "password123" }

    trait :owner do
      role { :owner }
    end
  end
end

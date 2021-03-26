FactoryBot.define do
  factory :user do
    name { "shota" }
    sequence(:email) { |n| "test#{n}@example.com" }
    favorite_team { "Liverpool" }
    user_address { "神奈川県" }
    password { "password" }
  end
end

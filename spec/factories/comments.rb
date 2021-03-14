FactoryBot.define do
  factory :comment do
    association :user
    association :event
    content { "MyText" }
  end
end

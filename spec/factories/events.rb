FactoryBot.define do
  factory :event do
    association :user
    event_name { "サッカーを観戦しよう" }
    description { "サッカーイベントです" }
    event_address { "東京都" }
    event_at { "2021-03-15 08:37:00" }
    event_team { "Liverpool" }
    capacity { 5 }
  end
end

FactoryBot.define do
  factory :event do
    association :user
    event_name { "サッカーを観戦しよう" }
    description { "サッカーイベントです" }
    event_address { "東京都" }
    event_start_at { DateTime.now }
    event_end_at { DateTime.now.tomorrow }
    event_team { "Liverpool" }
    capacity { 5 }
  end
end

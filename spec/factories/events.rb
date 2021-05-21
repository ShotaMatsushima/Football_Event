FactoryBot.define do
  factory :event do
    association :user
    name { "サッカーを観戦しよう" }
    description { "サッカーイベントです" }
    address { "東京都" }
    title { "カフェ" }
    start_at { DateTime.now }
    end_at { DateTime.now.tomorrow }
    event_team { "Liverpool" }
    capacity { 5 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/top-hero.png')) }
    latitude { 35.681 }
    longitude { 139.767 }
  end

  factory :event_params, class: Event do
    name { "プレミアリーグを観戦しよう" }
    description { "プレミアリーグイベントです" }
    address { "神奈川県" }
    title { "レストラン" }
    start_at { DateTime.now }
    end_at { DateTime.now.tomorrow }
    event_team { "Chelsea" }
    capacity { 10 }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/top-hero.png')) }
    latitude { 35.681 }
    longitude { 139.767 }
  end
end

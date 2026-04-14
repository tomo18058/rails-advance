FactoryBot.define do
  factory :event do
    title { "テストイベント" }
    description { "イベント説明" }
    held_on { Date.today }
    organizer_name { "主催者" }
    target_department { "高校生" }
    discarded_at { nil }
  end
end
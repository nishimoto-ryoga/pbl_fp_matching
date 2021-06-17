FactoryBot.define do
  factory :reservation_frame do
    # 翌週の月曜日を指定
    date { Time.zone.now.to_date + 8 - Time.zone.now.to_date.wday }
    association :planner
    association :time_frame, factory: :time_frame1
  end
end

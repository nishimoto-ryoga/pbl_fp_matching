FactoryBot.define do
  factory :reservation_frame do
    association :planner
    association :time_frame
  end
end

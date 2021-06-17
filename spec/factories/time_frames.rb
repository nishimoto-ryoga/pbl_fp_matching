FactoryBot.define do
  factory :time_frame1, class: TimeFrame do
    start_at { '10:00' }
    end_at { '10:30' }
  end

  factory :time_frame2, class: TimeFrame do
    start_at { '11:00' }
    end_at { '11:30' }
  end
end

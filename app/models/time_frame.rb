class TimeFrame < ApplicationRecord
  has_many :reservation_frames, dependent: :restrict_with_exception
end

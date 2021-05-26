class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :reservation_frame
end

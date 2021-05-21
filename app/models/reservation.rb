class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :reservtion_frame
end

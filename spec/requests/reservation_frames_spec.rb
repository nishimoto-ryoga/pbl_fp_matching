require 'rails_helper'

RSpec.describe "ReservationFrames", type: :model do
  let!(:planner) { FactoryBot.create(:planner) }
  let!(:time_frame) { FactoryBot.create(:time_frame) }
  it "正常に作成される" do
    reservation_frame = ReservationFrame.new(
      date: Time.zone.now.to_date,
      time_frame_id: time_frame.id,
      planner_id: planner.id
    )
    expect(reservation_frame).to be_valid
  end
  it "time_frame_idが無く作成されず" do
    reservation_frame = ReservationFrame.new(
      date: Time.zone.now.to_date,
      time_frame_id: time_frame.id,
      planner_id: nil
    )
    expect(reservation_frame.valid?).to eq(false)
  end
  it "planner_idが無く作成されず" do
    reservation_frame = ReservationFrame.new(
      date: Time.zone.now.to_date,
      time_frame_id: time_frame.id,
      planner_id: nil
    )
    expect(reservation_frame.valid?).to eq(false)
  end
  it "dateが無く作成されず" do
    reservation_frame = ReservationFrame.new(
      date: nil,
      time_frame_id: time_frame.id,
      planner_id: planner.id
    )
    expect(reservation_frame.valid?).to eq(false)
  end
end

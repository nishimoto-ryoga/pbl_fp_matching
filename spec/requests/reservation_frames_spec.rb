require 'rails_helper'

RSpec.describe ReservationFrame, type: :model do
  let!(:planner) { FactoryBot.create(:planner) }
  let!(:time_frame) { FactoryBot.create(:time_frame) }
  context 'date, time_frame_id, planner_id がすべて設定されている場合' do
    it 'reservation_frameが有効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date,
        time_frame_id: time_frame.id,
        planner_id: planner.id
      )
      expect(reservation_frame).to be_valid
    end
  end
  context 'time_frame_id が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date,
        time_frame_id: time_frame.id,
        planner_id: nil
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'planner_id が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date,
        time_frame_id: time_frame.id,
        planner_id: nil
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'date が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: nil,
        time_frame_id: time_frame.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
end

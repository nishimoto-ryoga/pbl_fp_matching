require 'rails_helper'

RSpec.describe ReservationFrame, type: :model do
  let!(:planner) { FactoryBot.create(:planner) }
  let!(:time_frame1) { FactoryBot.create(:time_frame1) }
  let!(:time_frame2) { FactoryBot.create(:time_frame2) }
  let!(:next_mon) { Time.zone.now.to_date + 8 - Time.zone.now.to_date.wday }
  let!(:next_sta) { Time.zone.now.to_date + 13 - Time.zone.now.to_date.wday }
  let!(:next_sun) { Time.zone.now.to_date + 7 - Time.zone.now.to_date.wday }

  context 'date, time_frame_id, planner_id がすべて設定されている場合' do
    it 'reservation_frameが有効' do
      reservation_frame = ReservationFrame.new(
        date: next_mon,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame).to be_valid
    end
  end
  context 'time_frame_id が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: next_mon,
        time_frame_id: time_frame1.id,
        planner_id: nil
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'planner_id が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: next_mon,
        time_frame_id: time_frame1.id,
        planner_id: nil
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'date が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: nil,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが土曜日10:00の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: next_sta,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが土曜日11:00の場合' do
    it 'reservation_frameが有効' do
      reservation_frame = ReservationFrame.new(
        date: next_sta,
        time_frame_id: time_frame2.id,
        planner_id: planner.id
      )
      expect(reservation_frame).to be_valid
    end
  end
  context 'dateが日曜日の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: next_sun,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが過去日付の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date - 1,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが1年以上後の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date + 400,
        time_frame_id: time_frame1.id,
        planner_id: planner.id
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
end

require 'rails_helper'

RSpec.describe ReservationFrame, type: :model do
  let!(:planner) { FactoryBot.create(:planner) }
  let!(:time_frame) { FactoryBot.create(:time_frame) }
  let!(:reservation_frame) { ReservationFrame.new(time_frame_id: time_frame.id, planner_id: planner.id) }

  context 'date が設定されていない場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: nil
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが月〜金のとき' do
    let!(:next_mon) { Time.zone.now.to_date + 8 - Time.zone.now.to_date.wday }
    context 'date, time_frame_id, planner_id がすべて設定されている場合' do
      it 'reservation_frameが有効' do
        reservation_frame.date = next_mon
        expect(reservation_frame).to be_valid
      end
    end
    context 'time_frame_id が設定されていない場合' do
      it 'reservation_frameが無効' do
        reservation_frame.date = next_mon
        reservation_frame.time_frame_id = nil
        expect(reservation_frame.valid?).to eq(false)
      end
    end
    context 'planner_id が設定されていない場合' do
      it 'reservation_frameが無効' do
        reservation_frame.planner_id = nil
        expect(reservation_frame.valid?).to eq(false)
      end
    end
  end
  context 'dateが土曜のとき' do
    let!(:next_sta) { Time.zone.now.to_date + 13 - Time.zone.now.to_date.wday }
    context '10:00の場合' do
      it 'reservation_frameが無効' do
        reservation_frame.date = next_sta
        expect(reservation_frame.valid?).to eq(false)
      end
    end
    context '11:00の場合' do
      let!(:other_time_frame) { TimeFrame.create(id: 3, start_at: '11:00', end_at: '11:30') }
      it 'reservation_frameが有効' do
        reservation_frame.date = next_sta
        reservation_frame.time_frame_id = other_time_frame.id
        expect(reservation_frame).to be_valid
      end
    end
  end
  context 'dateが日曜日のとき' do
    let!(:next_sun) { Time.zone.now.to_date + 7 - Time.zone.now.to_date.wday }
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: next_sun
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが過去日付の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date - 1
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
  context 'dateが1年以上後の場合' do
    it 'reservation_frameが無効' do
      reservation_frame = ReservationFrame.new(
        date: Time.zone.now.to_date + 400
      )
      expect(reservation_frame.valid?).to eq(false)
    end
  end
end

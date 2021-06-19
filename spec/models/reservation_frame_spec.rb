require 'rails_helper'

RSpec.describe ReservationFrame, type: :model do
  let!(:planner) { FactoryBot.create(:planner) }
  let!(:time_frame) { FactoryBot.create(:time_frame) }
  let!(:date) { nil }
  subject!(:reservation_frame) { ReservationFrame.new(date: date, time_frame_id: time_frame.id, planner_id: planner.id) }

  context 'date が設定されていない場合' do
    it { is_expected.not_to be_valid }
  end
  context 'dateが月〜金のとき' do
    let!(:date) { Date.current.next_week(%i[monday tuesday wednesday thursday friday].sample) }
    context 'date, time_frame_id, planner_id がすべて設定されている場合' do
      it { is_expected.to be_valid }
    end
    context 'time_frame_id が設定されていない場合' do
      it 'reservation_frameが無効' do
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
    let!(:date) { Date.current.next_week(:saturday) }
    context '10:00の場合' do
      it { is_expected.not_to be_valid }
    end
    context '11:00の場合' do
      let!(:other_time_frame) { TimeFrame.create(id: 3, start_at: '11:00', end_at: '11:30') }
      it 'reservation_frameが有効' do
        reservation_frame.time_frame_id = other_time_frame.id
        expect(reservation_frame).to be_valid
      end
    end
  end
  context 'dateが日曜日のとき' do
    let!(:date) { Date.current.next_week(:sunday) }
    it { is_expected.not_to be_valid }
  end
  context 'dateが昨日(過去日付)の場合' do
    let!(:date) { Time.zone.now.to_date - 1 }
    it { is_expected.not_to be_valid }
  end
  context 'dateが1年以上後の場合' do
    let!(:date) { Time.zone.now.to_date + 400 }
    it { is_expected.not_to be_valid }
  end
end

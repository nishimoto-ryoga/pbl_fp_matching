require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:client) { FactoryBot.create(:client) }
  let!(:reservation_frame) { FactoryBot.create(:reservation_frame, date: Time.zone.now.to_date) }
  subject(:reservation) { Reservation.new(reservation_frame_id: reservation_frame_id, client_id: client_id) }

  context 'client_id, reservation_frame_id がすべて設定されている場合' do
    let!(:reservation_frame_id) { reservation_frame.id }
    let!(:client_id) { client.id }
    it { is_expected.to be_valid }
  end
  context 'client_id が設定されていない場合' do
    let!(:reservation_frame_id) { reservation_frame.id }
    let!(:client_id) { nil }
    it { is_expected.not_to be_valid }
  end
  context 'reservation_frame_id が設定されていない場合' do
    let!(:reservation_frame_id) { nil }
    let!(:client_id) { client.id }
    it { is_expected.not_to be_valid }
  end
end

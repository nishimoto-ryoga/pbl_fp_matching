require 'rails_helper'

RSpec.describe "Reservations", type: :model do
  let!(:client) { FactoryBot.create(:client) }
  let!(:reservation_frame) { FactoryBot.create(:reservation_frame, date: Time.zone.now.to_date) }

  context 'client_id, reservation_frame_id がすべて設定されている場合' do
    it "reservationが有効" do
      reservation = Reservation.new(
        reservation_frame_id: reservation_frame.id,
        client_id: client.id
      )
      expect(reservation).to be_valid
    end
  end
  context 'client_id が設定されていない場合' do
    it "reservationが無効" do
      reservation = Reservation.new(
        reservation_frame_id: reservation_frame.id,
        client_id: nil
      )
      expect(reservation.valid?).to eq(false)
    end
  end
  context 'reservation_frame_id が設定されていない場合' do
    it "reservationが無効" do
      reservation = Reservation.new(
        reservation_frame_id: nil,
        client_id: client.id
      )
      expect(reservation.valid?).to eq(false)
    end
  end

end

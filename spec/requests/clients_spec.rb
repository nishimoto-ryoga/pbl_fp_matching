require 'rails_helper'

RSpec.describe Client, type: :request do
  describe 'client作成' do
    context '名前が10文字以上の場合' do
      it 'clientが作成されない' do
        client = Client.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: 'テストで10文字以上にする'
        )
        expect(client.valid?).to eq(false)
      end
    end
    context '名前に絵文字が含まれている場合' do
      it 'clientが作成されない' do
        client = Client.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: '😁😁'
        )
        expect(client.valid?).to eq(false)
      end
    end
  end

  describe 'マイページのアクセス' do
    let!(:client) { FactoryBot.create(:client) }

    context 'ログイン前' do
      it 'sign_inにリダイレクトされる' do
        get mypage_clients_path
        expect(response).to redirect_to new_client_session_path
      end
    end
    context 'ログイン後' do
      before do
        sign_in client
      end
      it '正常なレスポンスが返ってくる(200)' do
        get mypage_clients_path
        expect(response.status).to eq 200
      end
      it 'clientのnameが表示される' do
        get mypage_clients_path
        expect(response.body).to include client.name
      end
    end
  end
end

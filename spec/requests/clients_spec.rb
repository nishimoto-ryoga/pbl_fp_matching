require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "マイページのアクセス" do
    let!(:client) { FactoryBot.create(:client) }
    
    context "ログイン前" do
      it "sign_inにリダイレクトされる" do
        get mypage_clients_path
        expect(response).to redirect_to new_client_session_path
      end
    end
    context "ログイン後" do
      before do
        sign_in client
      end
      it "正常なレスポンスが返ってくる(200)" do
        get mypage_clients_path
        expect(response.status).to eq 200
      end
      it "clientのnameが表示される" do
        get mypage_clients_path
        expect(response.body).to include client.name
      end
    end
  end

end

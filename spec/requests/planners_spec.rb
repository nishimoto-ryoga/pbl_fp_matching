require 'rails_helper'

RSpec.describe Planner, type: :request do
  describe 'マイページのアクセス' do
    let!(:planner) { FactoryBot.create(:planner) }

    context 'ログイン前' do
      it 'sign_inにリダイレクトされる' do
        get mypage_planners_path
        expect(response).to redirect_to new_planner_session_path
      end
    end
    context 'ログイン後' do
      before do
        sign_in planner
      end
      it '正常なレスポンスが返ってくる(200)' do
        get mypage_planners_path
        expect(response.status).to eq 200
      end
      it 'plannerのnameが表示される' do
        get mypage_planners_path
        expect(response.body).to include planner.name
      end
    end
  end

  describe 'FP一覧(index)のアクセス' do
    let!(:planner) { FactoryBot.create(:planner) }
    let!(:client) { FactoryBot.create(:client) }

    context 'ログインなし' do
      it 'clientのsign_inにリダイレクトされる' do
        get planners_path
        expect(response).to redirect_to new_client_session_path
      end
    end
    context 'Plannerでログイン' do
      before do
        sign_in planner
      end
      it 'clientのsign_inにリダイレクトされる' do
        get planners_path
        expect(response).to redirect_to new_client_session_path
      end
    end
    context 'Clientでログイン' do
      before do
        sign_in client
      end
      it '正常なレスポンスが返ってくる(200)' do
        get planners_path
        expect(response.status).to eq 200
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Planner, type: :request do
  describe "マイページのアクセス" do
    before do
      @planner = FactoryBot.create(:planner)
    end
    context "ログイン前" do
      it "sign_inにリダイレクトされる" do
        get planner_path(@planner.id)
        expect(response).to redirect_to new_planner_session_path
      end
    end
    context "ログイン後" do
      before do
        sign_in @planner
      end
      it "正常なレスポンスが返ってくる(200)" do
        get planner_path(@planner.id)
        expect(response.status).to eq 200
      end
      it "plannerのnameが表示される" do
        get planner_path(@planner.id)
        expect(response.body).to include @planner.name
      end
    end
  end
end

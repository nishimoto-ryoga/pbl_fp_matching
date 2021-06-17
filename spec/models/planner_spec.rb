require 'rails_helper'

RSpec.describe Planner, type: :model do
  describe 'planner作成' do
    context '名前に絵文字を含まず、10文字未満の場合' do
      it 'plannerが作成される' do
        planner = Planner.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: 'ニックネーム'
        )
        expect(planner).to be_valid
      end
    end
    context '名前が10文字以上の場合' do
      it 'plannerが作成されない' do
        planner = Planner.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: 'テストで10文字以上にする'
        )
        expect(planner.valid?).to eq(false)
      end
    end
    context '名前に絵文字が含まれている場合' do
      it 'plannerが作成されない' do
        planner = Planner.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: '😁😁'
        )
        expect(planner.valid?).to eq(false)
      end
    end
  end
end

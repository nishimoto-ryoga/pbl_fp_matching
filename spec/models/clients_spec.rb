require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'client作成' do
    context '名前に絵文字を含まず、10文字未満の場合' do
      it 'clientが作成される' do
        client = Client.new(
          email: 'a@a',
          password: 'aaaaaa',
          name: 'ニックネーム'
        )
        expect(client).to be_valid
      end
    end
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
end

require 'rails_helper'

RSpec.describe Court, type: :model do
  before do
    @court = FactoryBot.build(:court)
  end

  describe 'コートの保存' do
    context 'コートが投稿できる場合' do
      it '画像とテキストを投稿できる' do
        expect(@court).to be_valid
      end
      it 'テキストのみで投稿できる' do
        @court.image = ''
        expect(@court).to be_valid
      end
    end
    context 'コートが投稿できない場合' do
      it 'テキストが空では投稿できない' do
        @court.text = ''
        @court.valid?
        expect(@court.errors.full_messages).to include("Text can't be blank")
      end
      it 'イメージが空では投稿できない' do
        @court.image = ''
        @court.valid?
        expect(@court.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @court.user = nil
        @court.valid?
        expect(@court.errors.full_messages).to include('User must exist')
      end
    end
  end
end
require 'rails_helper'

describe Comment do
  before do
    @user = FactoryBot.create(:user)
    @fashion = FactoryBot.create(:fashion)
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントがうまくいくとき' do
      it "すべて正しいフォーマットで入力されていればコメントできる" do
        expect(@comment).to be_valid
      end
    end
    context 'コメントがうまくいかないとき' do
      it "textが空ではコメントできないこと" do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end

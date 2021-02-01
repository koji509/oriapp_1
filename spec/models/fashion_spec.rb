require 'rails_helper'
describe Fashion do
  before do
    @user = FactoryBot.create(:user)
    @fashion = FactoryBot.build(:fashion)
  end

  describe '投稿機能' do
    context '投稿がうまくいくとき' do
      it "すべて正しいフォーマットで入力されていれば出品できる" do
        expect(@fashion).to be_valid
      end
    end
    context '投稿がうまくいかないとき' do
      it "artistが空だと投稿できない" do
        @fashion.artist = ''
        @fashion.valid?
        expect(@fashion.errors.full_messages).to include("Artist can't be blank")
      end
      it "brandが空だと投稿できない" do
        @fashion.brand = ""
        @fashion.valid?
        expect(@fashion.errors.full_messages).to include("Brand can't be blank")
      end
      it "itemが空だと投稿できない" do
        @fashion.item = ''
        @fashion.valid?
        expect(@fashion.errors.full_messages).to include(" can't be blank")
      end
      it "imageが空だと投稿できない" do
        @fashion.image = ''
        @fashion.valid?
        expect(@fashion.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
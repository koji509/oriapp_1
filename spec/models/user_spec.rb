require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "すべて正しいフォーマットで入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "userが空だと登録できない" do
        @user.user = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User can't be blank")    
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")    
      end
      it "emailに@が含まれていない場合登録できない" do
        @user.email = "testexample.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end    
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致していない場合は登録できない" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "profileが空の場合登録できない" do
        @user.profile = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nickname、email、password、password_confirmationが存在し、passwordが7文字以上の半角英数字混同であれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空の場合は登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空の場合は登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに@が含まれていない場合は登録できないこと' do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが半角英数字混同かつ6文字以下の場合は登録できないこと' do
      @user.password = "aaa000"
      @user.password_confirmation = "aaa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
    end

    it 'passwordが存在してもpassword_confirmationが空の場合は登録できないこと' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end

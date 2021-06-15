require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do 
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが6文字以下であれば登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'test.test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '123aa'
      @user.password_confirmation = '123aa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordは英数字混合でなければ登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが半角英数字のみの場合は登録できない' do
      @user.password = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが全角英数字のみの場合は登録できない' do
      @user.password = '１２３ＡＢＣ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'birthdayが空では登録できない' do
      @user.birthday
      @user.valid?
      expect(@user.errors.full_messages).to include 
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name is invalid. Input full-width characters."
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name is invalid. Input full-width characters."
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name is invalid. Input full-width characters."
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name is invalid. Input full-width characters."
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name kana can't be blank"
    end
    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width characters."
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name kana can't be blank"
    end
    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width characters."
    end
  end
end




#パスワードが空では登録できない!
#パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）!
#ユーザー本名は、名字と名前がそれぞれ必須であること!
#ユーザー本名のフリガナは、名字と名前がそれぞれ¥必須であること!
#生年月日が必須であること!
#メールアドレスが一意性であること!
#パスワードは、確認用を含めて2回入力すること!
#ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること!
#ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること!
#メールアドレスは、@を含む必要があること!
#パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと!

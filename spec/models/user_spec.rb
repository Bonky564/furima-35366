require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe "ユーザー新規登録" do
      before do
        @user = FactoryBot.build(:user)
      end

      context '新規登録できるとき' do
        it '全ての項目があれば新規登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a12345'
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
          end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "surnameが空では登録できないこと" do
          @user.surname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname can't be blank")
        end

        it "surname_readingが空では登録できないこと" do
          @user.surname_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname reading can't be blank")
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "first_name_readingが空では登録できないこと" do
          @user.first_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end

        it "date_of_birthが空では登録できないこと" do
          @user.date_of_birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Date of birth can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = 'a1234'
          @user.password_confirmation = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
  
        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'a12345'
          @user.password_confirmation = 'b12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'surnameが全角入力でなければ登録できないこと' do
          @user.surname = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname is invalid. Input full-width characters.")
        end

        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
        end

        it 'surname_readingが全角カタカナでなければ登録できないこと' do
          @user.surname_reading = 'かたかな'
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname reading is invalid. Input full-width katakana characters.")
        end

        it 'first_name_readingが全角カタカナでなければ登録できないこと' do
          @user.first_name_reading = 'かたかな'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
        end

        it 'emailに@が含まれていない場合登録できないこと' do
          @user.email = 'abc.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが半角でなければ登録できないこと' do
          @user.password = 'ＡＢｃ１２３'
          @user.password_confirmation = 'ＡＢｃ１２３'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
        end

        it 'passwordが半角英数字混合でなければ登録できないこと(英字のみ)' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
        end
  
        it 'passwordが半角英数字混合でなければ登録できないこと(数字のみ)' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
        end
      end
    end
  end
end
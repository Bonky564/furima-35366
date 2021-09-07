require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address,user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @buy_address.prefecture_id = 1
          @buy_address.valid?
          expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'house_numが空だと保存できないこと' do
        @buy_address.house_num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House num can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'telephone_numが空だと保存できないこと' do
        @buy_address.telephone_num = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone num can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeの保存にはハイフンが必要であること' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'telephone_numは11桁以内の数値のみ保存可能なこと(数値)' do
        @buy_address.telephone_num = 'あいうえおかきくけこさ'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone num is invalid")
      end
      it 'telephone_numは11桁以内の数値のみ保存可能なこと(桁)' do
        @buy_address.telephone_num = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone num is too long (maximum is 11 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemrが紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    describe "出品機能" do
      before do
        @item = FactoryBot.build(:item)
      end

      context '新規登録できるとき' do
        it '全ての項目があれば出品できること' do
          expect(@item).to be_valid
        end
      end
      context '出品できないとき' do
        it 'titleが空では登録できないこと' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it 'descriptionが空では登録できないこと' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'category_idが空では登録できないこと' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'state_idが空では登録できないこと' do
          @item.state_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'delivery_charge_idが空では登録できないこと' do
          @item.delivery_charge_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end

        it 'prefecture_idが空では登録できないこと' do
          @item.prefecture_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'day_idが空では登録できないこと' do
          @item.day_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Day can't be blank")
        end

        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '価格が300円以下だと登録出来ないできない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '価格が9999999円以上だと登録出来ないできない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it '価格が半角数字以外だと登録出来ないできない(全角数字)' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '価格が半角数字以外だと登録出来ないできない(全角)' do
          @item.price = 'あいう'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '価格が半角数字以外だと登録出来ないできない(半角文字)' do
          @item.price = 'abcd'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it '価格が半角数字以外だと登録出来ないできない(混合)' do
          @item.price = '１2あa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end

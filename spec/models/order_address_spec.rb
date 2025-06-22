require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'すべての情報が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が「3桁-4桁」の形式でないと購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は「123-4567」の形式で入力してください")
      end

      it '都道府県が未選択（id:0）では購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture を選択してください")
      end

      it '市区町村が空では購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が空では購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁未満では購入できない' do
        @order_address.telephone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number は10桁または11桁の数字で入力してください")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_address.telephone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number は10桁または11桁の数字で入力してください")
      end

      it '電話番号にハイフンが含まれていると購入できない' do
        @order_address.telephone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number は10桁または11桁の数字で入力してください")
      end

      it 'user_idが紐付いていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐付いていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'tokenがあれば保存できる' do
        @order_address.token = 'some_valid_token'
        expect(@order_address).to be_valid
      end
    end
  end
end

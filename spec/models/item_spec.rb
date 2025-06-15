require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品登録できる時' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end

      it 'product_descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = 'priceあいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end

      it 'priceが全角数字では登録できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'
      end

      it 'priceが300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end

      it 'category_idが0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'condition_idが0では登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'shipping_costs_idが0では登録できない' do
        @item.shipping_costs_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping costs can't be blank"
      end

      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end

      it '10000000以上の値では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end

      it '配送予定日は空欄にできないこと' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
    end
  end
end

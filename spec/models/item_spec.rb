require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品新規登録' do
   context '商品登録できる時' do
    it '商品登録できる時' do
     expect(@item).to be_valid
     end
  end 

   context '商品登録できない時' do
    it 'imageが空では登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    context '商品名が空では登録できない' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end

    context '商品の説明が空では登録できない' do
    it 'infoが空では登録できない' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Info can't be blank"
    end

    
    context '価格は空では登録できない' do
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    context '価格が数字でないとき登録できない' do  #ここからまだ未完成
    it 'priceが空では登録できない' do
      @item.price = 'priceあいうえお'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end

    it '価格が全角だと登録できないこと' do
      @user.password = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end


  end
end
end
end
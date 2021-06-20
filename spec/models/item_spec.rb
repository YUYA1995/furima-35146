require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context '新規登録できるとき' do
    it '全ても項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '新規登録できないとき' do
    it '商品名が空では登録できない' do
      @item.title = ''
      @item.valid? 
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it '商品説明が空では登録できない' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Explain can't be blank"
    end
    it 'カテゴリー情報が空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it '配送料の負担が空では登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage can't be blank"
    end
    it '発送元の地域が空では登録できない' do
      @item.address_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Address can't be blank"
    end
    it '発送までの日数が空では登録できない' do
      @item.deliver_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Deliver day can't be blank"
    end
    it '販売価格が空では登録できない' do
      @item.product_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price can't be blank"
    end
    it 'category_idは1が選択された場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category must be other than 1"
    end
    it 'address_idは1が選択された場合は出品できない' do
      @item.address_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Address must be other than 1"
    end
    it 'postage_idは1が選択された場合は出品できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage must be other than 1"
    end
    it 'deliver_day_idは1が選択された場合は出品できない' do
      @item.deliver_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Deliver day must be other than 1"
    end
    it 'condition_idは1が選択された場合は出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition must be other than 1"
    end
    it '販売価格が全角文字では登録できない' do
      @item.product_price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price is not a number"
    end
    it '販売価格が半角英数混合では登録できない' do
      @item.product_price = 'A1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price is not a number"
    end
    it '販売価格が英数だけでは登録できない' do
      @item.product_price = 'A'
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price is not a number"
    end
    it '販売価格が299円以下では登録できない' do
      @item.product_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price must be greater than 300"
    end
    it '販売価格が10,000,000円以上では登録できない' do
      @item.product_price = 10,000,000
      @item.valid?
      expect(@item.errors.full_messages).to include "Product price is not a number"
    end
  end
end
    
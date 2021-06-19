require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

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
  
end
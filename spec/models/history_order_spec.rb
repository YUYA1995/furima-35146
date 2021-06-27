require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  before do
    @order = FactoryBot.build(:history_order)
  end

  context '内容に問題ない場合' do
    it "必須項目があれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
      @order.delivery_postalcode = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery postalcode can't be blank")
    end
    it "郵便番号にハイフンが空では保存できない" do
      @order.delivery_postalcode = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery postalcode is invalid. Include hyphen(-)")
    end
    it "都道府県が空では保存ができないこと" do
      @order.address_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it "市区町村が空では保存ができないこと" do
      @order.delivery_city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery city can't be blank")
    end
    it "番地が空では保存ができないこと" do
      @order.delivery_state = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery state can't be blank")
    end
    it "電話番号が空では保存ができないこと" do
      @order.delivery_phone = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery phone can't be blank")
    end
  end
end

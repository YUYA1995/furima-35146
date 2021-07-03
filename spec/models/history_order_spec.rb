require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:history_order, user_id: user.id, item_id: item.id)
    sleep 0.5
  end

  context '内容に問題ない場合' do
    it "必須項目があれば保存ができること" do
      expect(@order).to be_valid
    end
    it "建物名は空でも購入できる" do
      @order.delivery_building = ''
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
    it "都道府県の選択が0では保存ができないこと" do
      @order.address_id = 1
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
    it "電話番号が11以上では登録できない" do
      @order.delivery_phone = '123456789101'
      @order.valid?
      expect(@order.errors.full_messages).to include("Delivery phone is maximum 11")
    end
    it "user_idが空では保存できないこと" do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では保存できないこと" do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では保存できないこと" do
      @order.token= ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
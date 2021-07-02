class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @history_order = HistoryOrder.new
  end

  def create 
    @history_order = HistoryOrder.new(order_params)
    if @history_order.valid? 
       pay_item
       @history_order.save
       return redirect_to root_path
    else
      render 'index'
    end
  end

  private

   def item_params
     params.require(:item).permit(:title, :product_price, :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, :explain, :image).merge(user_id: current_user.id)
   end

  def order_params
    params.require(:history_order).permit(:delivery_postalcode, :delivery_city,:delivery_state,:delivery_phone,:delivery_building, :address_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_index
    if current_user.id == @item.user.id || @item.history.present?
      redirect_to root_path 
    end
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.product_price, 
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
end

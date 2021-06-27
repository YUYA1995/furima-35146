class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new
  end

  def create 
    @item = Item.find(params[:item_id])
    @history_order = HistoryOrder.new(order_params)
    if @history_order.valid?
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
    params.require(:history_order).permit(:delivery_postalcode, :delivery_city,:delivery_state,:delivery_phone,:delivery_building, :address_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

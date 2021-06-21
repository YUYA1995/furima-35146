class ItemsController < ApplicationController
  before_action :authenticate_user! [:index]

  def index
   # @items = Item.all
  end

  def new
   @item = Item.new 
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def show
   # @item = Item.all
  #end

  private

  def item_params
    params.require(:item).permit(:title, :product_price, :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, :explain, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
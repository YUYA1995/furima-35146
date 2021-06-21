class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    #@images = Image.all
    @items = Item.all
    @items = Item.order("id DESC")
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
end
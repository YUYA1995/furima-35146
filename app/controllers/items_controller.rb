class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item
  #before_action :move_to_index, except: [:index, :show]
  def index
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

  def edit
    @item = Item.find(params[:id])
      unless current_user.id == @item.user_id 
        redirect_to root_path
      end
  end
  
  def update
    @item = Item.find(params[:id])
     if @item.update(item_params) && current_user.id == @item.user_id 
       redirect_to root_path
     else
       render :edit
     end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:title, :product_price, :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, :explain, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # # def move_to_index
  #   unless user_signed_in? #&& current_user.id == @item.user_id 
  #     redirect_to action: :index
  #   end
  #end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :product_price, :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, :explain, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
     if current_user.id != @item.user_id || @item.history.present?
       redirect_to action: :index 
     end
  end
end

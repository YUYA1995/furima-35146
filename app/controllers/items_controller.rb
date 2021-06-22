class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

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

  # def edit
  #   def edit
  #     @item = Item.find(params[:id])
  #     unless user_signed_in? && current_user.id == @item.user_id
  #       redirect_to action: :index
  #     end
  #   end
  # end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :product_price, :category_id, :address_id, :condition_id, :postage_id, :deliver_day_id, :explain, :image).merge(user_id: current_user.id)
  end
end
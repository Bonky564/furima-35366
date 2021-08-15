class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
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

  
  private

  def item_params
      params.require(:item).permit(:title, :description, :category_id, :state_id, :price, :delivery_charge_id, :prefecture_id, :day_id,:image).merge(user_id: current_user.id)
  end
end

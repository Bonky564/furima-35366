class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :move_to_index, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  
  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def update
      if @item.update(item_params)
        redirect_to item_path(@item.id)
        else
          render :edit
      end
  end

  def move_to_index
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  
  private

  def item_params
      params.require(:item).permit(:title, :description, :category_id, :state_id, :price, :delivery_charge_id, :prefecture_id, :day_id,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_num, :building_name, :telephone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

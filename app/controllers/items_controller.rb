class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('id desc')
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def redirect_root
    if @item.user_id != current_user.id || @item.purchase != nil #　コードを追加
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :delivery_charge_id, :status_id, :ship_from_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end

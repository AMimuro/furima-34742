class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "items/new"
    end
  end


  private

  def item_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday).merge(user_id:current_user.id)
  end

end

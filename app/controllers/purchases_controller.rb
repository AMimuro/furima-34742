class PurchasesController < ApplicationController

  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    binding.pry
    if @purchase.valid?
      @purchase.seve
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :ship_from_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

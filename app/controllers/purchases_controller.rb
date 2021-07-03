class PurchasesController < ApplicationController

  def index
    @purchase_receiver = PurchaseReceiver.new
    @item = Item.find(params[:item_id])
  end
  

  def create
    @purchase_receiver = PurchaseReceiver.new(purchase_params)
    if @purchase_receiver.valid?
       @purchase_receiver.save
       redirect_to root_path
    else
       render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_receiver).permit(:postal_code, :ship_from_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

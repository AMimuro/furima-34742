class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]

  def index
    @purchase_receiver = PurchaseReceiver.new
  end  

  def create
    @purchase_receiver = PurchaseReceiver.new(purchase_params)
    if @purchase_receiver.valid?
      pay_item
      @purchase_receiver.save
      redirect_to root_path
    else
       render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_receiver).permit(:postal_code, :ship_from_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
        card: purchase_params[:token],   
        currency: 'jpy'                  
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    if @item.user_id == current_user.id || @item.purchase != nil  
      redirect_to root_path
    end
  end

end

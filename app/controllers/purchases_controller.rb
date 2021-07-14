class PurchasesController < ApplicationController

  def index
    @purchase_receiver = PurchaseReceiver.new
    @item = Item.find(params[:item_id])
  end  

  def create
    @item = Item.find(params[:item_id])
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
      amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                  # 通貨の種類（日本円）
    )
  end

end

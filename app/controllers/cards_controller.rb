class CardsController < ApplicationController
  before_action :item_find, only: [:new, :purchases]
  def new
    @item = Item.new
  end

  def purchases # 購入する時のアクションを定義
    @item = Item.new
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

    ItemPurchase.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する

    redirect_to root_path
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:card_token] 
    )
    card = Card.new( # 顧客トークンとログインしているユーザーを紐付けるインスタンスを生成
      card_token: params[:card_token],
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
   
    if card.save
      redirect_to root_path
    else
      redirect_to action: "new" # カード登録画面へリダイレクト
    end
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

end
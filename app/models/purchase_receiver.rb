class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。ハイフンを入れてください。"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください。"}
    validates :address, :token, :user_id, :item_id
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "は無効です。"}

  end
  validates :ship_from_id, numericality: { other_than: 0, message: "を入力してください" }

  def save
  purchase =  Purchase.create(user_id: user_id, item_id: item_id)
  Receiver.create(postal_code: postal_code, ship_from_id: ship_from_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase: purchase)
  end
end
class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :address, :building_name, :phone_number, :purchase, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, :token
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}

  end
  validates :ship_from_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
  purchase =  Purchase.create(user_id: user_id, item_id: item_id)
  Receiver.create(postal_code: postal_code, ship_from_id: ship_from_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase: purchase)
  end
end
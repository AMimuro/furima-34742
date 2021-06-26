class Receiver
  belongs_to :purchase
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_id, :city, :address, :building_name, :phone_number, :purchase

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number
  end
  validates :ship_from_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user =  User.create(nickname: nickname, email: email, password: password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birthday: birthday)
    Item.create(item_name: item_name, item_text: item_text, category_id: category.id, status_id: status.id, delivery_charge_id: delivery.charge.id, ship_from_id: ship.from.id, shipping_day_id: shipping.day.id, price: price, user_id: user.id)
  end
end
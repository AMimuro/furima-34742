class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :price, inclusion: { in: 300..9_999_999 }
  end
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :ship_from_id
    validates :shipping_day_id
  end
  validates :price, numericality: {only_integer: true}
  def was_attached?
    self.image.attached?
  end
end

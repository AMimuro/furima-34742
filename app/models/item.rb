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
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true, message: "Half-width number." }
    validates :category_id, numericality: { other_than: 0, message: 'Select' }
    validates :status_id, numericality: { other_than: 0, message: 'Select' }
    validates :delivery_charge_id, numericality: { other_than: 0, message: 'Select' }
    validates :ship_from_id, numericality: { other_than: 0, message: 'Select' }
    validates :shipping_day_id, numericality: { other_than: 0, message: 'Select' }

  end
end

class CreateItemPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :item_purchases do |t|
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.references :user, foreign_key: true
      t.string :category, index: true
      t.string :brand, index: true
      t.string :state
      t.string :delivery_fee_payer
      t.string :shipping_method
      t.string :shipping_source_area
      t.string :estimated_shipping_date
      t.integer :price
      t.text :description
      t.timestamps
    end
  end
end

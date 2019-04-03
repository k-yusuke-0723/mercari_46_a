class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :delivery_fee
      t.integer :trade_status
      t.timestamps
    end
  end
end
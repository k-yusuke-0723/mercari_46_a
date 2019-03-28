class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item, foreign_key: true
      t.text  :image1
      t.text  :image2
      t.text  :image3
      t.text  :image4
      t.timestamps
    end
  end
end

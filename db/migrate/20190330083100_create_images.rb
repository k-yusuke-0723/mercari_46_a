class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item, foreign_key: true
      t.text  :image1
      t.text  :image2
      t.text  :image3
      t.text  :image4
      t.text  :image5
      t.text  :image6
      t.text  :image7
      t.text  :image8
      t.text  :image9
      t.text  :image10
      t.timestamps
    end
  end
end

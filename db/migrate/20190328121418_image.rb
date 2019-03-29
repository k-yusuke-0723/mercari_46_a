class Image < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :iamge5, :text
    add_column :images, :iamge6, :text
    add_column :images, :iamge7, :text
    add_column :images, :iamge8, :text
    add_column :images, :iamge9, :text
    add_column :images, :iamge10, :text
  end
end

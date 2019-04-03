class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :birthday_year, :integer
    add_column :users, :birthday_month, :integer
    add_column :users, :birthday_day, :integer
    add_column :users, :postcode, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :block, :integer
    add_column :users, :building, :integer
    add_column :users, :phone_number, :string, unique: true
    add_column :users, :point, :integer
    add_column :users, :point_exp_date, :date
    add_column :users, :biography, :text
    add_column :users, :user_image, :string
  end
end

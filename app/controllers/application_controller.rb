class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_year, :birthday_month, :birthday_day, :postcode, :prefecture, :city, :block, :building, :phone_number, :point, :point_exp_date, :biography, :user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_year, :birthday_month, :birthday_day, :postcode, :prefecture, :city, :block, :building, :phone_number, :point, :point_exp_date, :biography, :user_image])
  end

end

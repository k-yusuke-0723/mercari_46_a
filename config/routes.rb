Rails.application.routes.draw do
  devise_for :users
  resources :test_views do
    get :creditcard
  end
end

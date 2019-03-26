Rails.application.routes.draw do
  devise_for :users
  resources :credit_card, only: [:new]
  get 'logout' => 'test_views#logout'
end

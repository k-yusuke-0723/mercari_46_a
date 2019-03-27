Rails.application.routes.draw do
  devise_for :users
  resources :credit_card, only: [:new]
  resources :sells, only: [:new]
end

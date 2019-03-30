Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :credit_card, only: [:new]
  resources :sells, only: [:new]
  resources :items
  resources :users do
    get :logout, on: :member
  end

  resources :mypages, only: [:show, :edit]

  resources :trades, only: [:new]

end

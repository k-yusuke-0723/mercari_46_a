Rails.application.routes.draw do
  devise_for :users
  resources :credit_card, only: [:new]

  resources :users do
    get :logout, on: :member
  end

  resources :mypages, only: [:show, :edit]

end

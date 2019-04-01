Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  resources :credit_card, only: [:new]
  resources :sells, only: [:new]

  resources :users do
    get :logout, on: :member
  end

  resources :mypages, only: [:show, :edit]

  resources :items  do
    resources :trades do
        collection do
          post 'purchase'
        end
    end
  end

end

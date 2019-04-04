Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

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
          post 'productbuy'
        end
    end
  end

  resources :registrations,only: :new

end

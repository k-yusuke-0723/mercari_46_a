Rails.application.routes.draw do
root 't#index'

  devise_for :users
end

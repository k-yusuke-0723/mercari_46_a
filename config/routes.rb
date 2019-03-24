Rails.application.routes.draw do
root 't#index'

  devise_for :users
  get 't' => 't#index'
  get 'usercheck' => 't#usercheck'
  get 'signup' => 't#signup'
  get 'login' => 't#login'

end

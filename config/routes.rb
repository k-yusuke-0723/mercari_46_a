Rails.application.routes.draw do
root 't#index'

  devise_for :users
  get 't' => 't#index'
  get 'userCheck' => 't#userCheck'

end

Rails.application.routes.draw do
root 't#index'

  devise_for :users
  get 't' => 't#index'
  get 'usercheck' => 'test_views#usercheck'
  get 'signup' => 'test_views#signup'
  get 'login' => 'test_views#login'

end

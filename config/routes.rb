Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :tours do
  	resources :reviews
  end
  
  root "tours#index"
  get '/peta', to: 'pages#peta'
end

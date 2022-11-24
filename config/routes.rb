Rails.application.routes.draw do
  devise_for :users
  root'albums#index'
  get'/albums/myalbum', to:'albums#myalbum'
  resources :albums 
end

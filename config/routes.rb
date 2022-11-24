Rails.application.routes.draw do

  devise_for :users
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root'albums#index'
  get'/albums/myalbum', to:'albums#myalbum'

  

  resources :albums 

end

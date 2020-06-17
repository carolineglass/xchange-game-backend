Rails.application.routes.draw do
  # get '/scoreboards' => 'scoreboards#index'
  get '/items' => 'items#index'
  get '/countries' => 'countries#index'
  get '/conversions' => 'conversions#index'
  # post '/scoreboards' => 'scoreboards#create'
  # patch '/scoreboards/:id' => 'scoreboards#update'


  
  # BELOW are the routes that were generated by resource 
  resources :scoreboards
  # resources :conversions
  # resources :items
  # resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

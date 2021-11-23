Rails.application.routes.draw do
  devise_for :users
  root to: "words#index" 
  resources :words
  resources :users, only: :show
  #collection do
    #get 'search'
end

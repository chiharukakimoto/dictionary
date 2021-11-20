Rails.application.routes.draw do
  root to: "words#index" 
  resources :words, only: [:index, :new, :create, :edit, :destroy]
  resources :words
  #collection do
    #get 'search'
end

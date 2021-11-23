Rails.application.routes.draw do
  root to: "words#index" 
  resources :words
  #collection do
    #get 'search'
end

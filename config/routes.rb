Rails.application.routes.draw do
  devise_for :users
  resources :words
  resources :games
  root 'words#index'
end

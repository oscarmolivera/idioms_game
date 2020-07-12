Rails.application.routes.draw do
  devise_for :users
  resources :words
  resources :games
  resources :answers, only: %i[create]
  root 'words#index'
end

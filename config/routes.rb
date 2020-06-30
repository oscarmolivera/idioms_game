Rails.application.routes.draw do
  devise_for :users
  resources :words
  root 'words#index'
end

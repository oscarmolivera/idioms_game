Rails.application.routes.draw do
  devise_for :users
  resources :words, only: %i[index]
  root 'words#index'
end

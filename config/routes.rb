Rails.application.routes.draw do
  devise_for :users
  resources :words, only: %i[index new create show]
  root 'words#index'
end

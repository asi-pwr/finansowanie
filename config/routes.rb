# frozen_string_literal: true

Rails.application.routes.draw do
  resources :organizations
<<<<<<< HEAD
  resources :applications, only: %i[new create]
  root 'pages#home'
  get "/", to: "pages#home"
=======
  resources :applications #, only: %i[index new create]
  root 'pages#root'
  get "/root", to: "pages#root"
>>>>>>> Add basic UI for viewing applications
  devise_for :users
  resources :faculties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

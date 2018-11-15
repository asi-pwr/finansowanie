# frozen_string_literal: true

Rails.application.routes.draw do
  resources :organizations
  resources :applications
  root 'pages#home'
  get "/", to: "pages#home"
  devise_for :users
  resources :faculties
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

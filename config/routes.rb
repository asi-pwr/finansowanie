# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applications, only: [:new, :create]

  root 'pages#root'
  get "/root", to: "pages#root"
  devise_for :users
  resources :faculties 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

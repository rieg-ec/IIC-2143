# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show edit update]
  resources :courses, only: %i[index show] do
    member do
      post :register_student
    end
  end

  root to: 'home#index'

  devise_for :users, path_prefix: 'accounts'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

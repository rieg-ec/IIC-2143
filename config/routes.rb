# frozen_string_literal: true

Rails.application.routes.draw do

  resources :users, only: [:index, :show, :edit, :update]

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
end

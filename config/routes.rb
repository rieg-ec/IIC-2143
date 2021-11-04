# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show edit update]
  resources :courses, only: %i[index show]

  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :courses, only: [:index] do
        member do
          post :register
        end
      end
    end
  end

  root to: 'home#index'

  devise_for :users, path_prefix: 'accounts'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

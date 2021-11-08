# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show edit update]
  resources :courses, only: %i[show] do
    resources :lectures, only: %i[show new create destroy]
  end

  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :courses, only: %i[index show] do
        member do
          post :register
        end
      end

      resources :reviews, only: %i[create destroy show index]
      resources :questions, only: %i[create destroy index]
    end
  end

  root to: 'home#index'

  devise_for :users, path_prefix: 'accounts'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end

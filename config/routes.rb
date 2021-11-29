# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[edit update] do
    collection do
      get '/profile', action: :show
    end
  end
  resources :courses, only: %i[show new create destroy] do
    resources :lectures, only: %i[show new create destroy]
  end

  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      get :books, to: 'books#index'
      resources :courses, only: %i[index show] do
        resources :reviews, only: %i[index show create destroy]
        resources :questions, only: %i[index create destroy]
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

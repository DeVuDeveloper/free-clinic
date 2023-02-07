# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :doctors

  root 'home#welcome'

  namespace :users do
    resources :doctors, only: %i[index]
    resources :appointments, only: %i[index show new create]
  end

  namespace :doctors do
    resources :users, only: %i[index]
    resources :appointments, only: %i[index show] do
      resources :recommendations, only: %i[new create]
    end
  end
end

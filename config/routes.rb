# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'users/sign_in', to: 'login#login', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy_and_leave', as: :destroy_user_session
  end

  post '/graphql', to: 'graphql#execute'

  get '/about-public', to: 'about#about'

  root to: 'index#index'
  match '*path', to: 'index#index', via: :all
end

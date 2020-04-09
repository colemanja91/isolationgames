# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'users/sign_in', to: 'login#login', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  post '/graphql', to: 'graphql#execute'

  get '/sign_in', as: 'signin', to: 'sessions#signin'
  get '/sign_out', as: 'signout', to: 'sessions#signout'
  get '/sign_up', as: 'signup', to: 'sessions#signup'

  get 'auth/sign_in', to: 'auth#signin'
  get 'auth/sign_out', to: 'auth#signout'

  get '/about-public', to: 'index#about'

  root to: 'index#index'
  match '*path', to: 'index#index', via: :all
end

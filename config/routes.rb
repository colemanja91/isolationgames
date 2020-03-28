Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  get '/sign_in', as: 'signin', to: 'sessions#signin'
  get '/sign_out', as: 'signout', to: 'sessions#signout'
  get '/sign_up', as: 'signup', to: 'sessions#signup'

  get 'auth/sign_in', to: 'auth#signin'
  get 'auth/sign_out', to: 'auth#signout'

  root to: 'index#index'
end

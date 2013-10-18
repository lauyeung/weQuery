WeQuery::Application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  resources :questions do
    post "vote"
  end

  namespace :api do
    resources :questions, only: [:index]
  end

  # namespace :admin
  #   resources :dashboards
  # end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/invalid/callback', to: 'sessions#invalid'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root 'questions#index'
end

WeQuery::Application.routes.draw do
  resources :dashboards, only: :index

  resources :questions do
    post "vote"
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/invalid/callback', to: 'sessions#invalid'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root 'questions#index'
end

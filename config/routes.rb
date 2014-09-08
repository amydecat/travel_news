Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links do
    resources :votes
    resources :comments
  end

  resources :users
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end

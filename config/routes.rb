Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links
  resources :votes
end

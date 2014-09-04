Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links do
    resources :votes
    resources :comments
  end
end

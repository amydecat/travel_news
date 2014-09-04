Rails.application.routes.draw do
  root :to => 'links#index'
  resources :links do
    resources :votes
  end
end

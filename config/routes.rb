Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  post '/tweet/new' => 'tweets#create'
  resources :users
  resources :tweets do
    resources :comments
  end
end

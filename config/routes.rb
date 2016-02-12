Rails.application.routes.draw do


  root to: 'pages#index'

  get 'about' => 'pages#about'

  get 'blog' => 'pages#blog'

  devise_for :users
  resources :users
  resources :articles do
    resources :comments
  end
  get 'visitors' => 'visitors#index'
end

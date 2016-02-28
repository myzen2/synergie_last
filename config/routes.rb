Rails.application.routes.draw do


  devise_for :users
  #resources :users
  root to:          'pages#index'

  get 'about'   =>  'pages#about'

  get 'blog'    =>  'pages#blog'

  resources     :articles do
    resources   :comments
  end

end

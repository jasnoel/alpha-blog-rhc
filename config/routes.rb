Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new]
  get 'signup', to: 'users#new', as: 'new_user'

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end

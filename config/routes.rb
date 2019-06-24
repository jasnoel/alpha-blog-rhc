Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new]

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new', as: 'new_user'

end

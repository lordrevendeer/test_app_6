Rails.application.routes.draw do
 root 'pages#home'
 get 'about', to: 'pages#about'
 resources :habits
 get 'signup', to: 'users#new'
 resources :users, except: [:new] 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 resources :categories
 get 'stats/update', to: 'stats#update'
 get '/calculate_streak', to: 'stats#calculate_streak'
end

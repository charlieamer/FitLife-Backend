Rails.application.routes.draw do
  resources :meals
  post 'user_token' => 'user_token#create'

  get 'user_preference' => 'user_preferences#index' 
  post 'user_preference' => 'user_preferences#create'
  put 'user_preference' => 'user_preferences#update'
  patch 'user_preference' => 'user_preferences#update'
  delete 'user_preference' => 'user_preferences#destroy'

  resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

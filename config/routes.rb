Rails.application.routes.draw do
  get 'items/create'

  resources :users, only: :show do
    resources :items, only: :create
  end
  
  devise_for :users
  root 'users#show'
  get 'about' => 'welcome#about'
end

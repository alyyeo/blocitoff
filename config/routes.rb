Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: :show do
    resources :items, only: [:create, :update, :destroy] do
      put :toggle
    end
  end
  
  root 'users#show'
  get 'about' => 'welcome#about'
  
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end

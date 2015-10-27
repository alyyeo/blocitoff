Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: :show do
    resources :items, only: [:create, :update, :destroy] do
      put :toggle
    end
  end
  
  root 'users#show'
  get 'about' => 'welcome#about'
end

Rails.application.routes.draw do
  get 'users/show' => 'users#show'
  
  devise_for :users
  root 'users#show'
  get 'about' => 'welcome#about'
end

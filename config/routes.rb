Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users
  root to: 'items#index'
  resources :users ,only: [:index, :show] 
  resources :items ,only: [:new, :create, :edit, :show]

end

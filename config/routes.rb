Rails.application.routes.draw do
  root 'trails#index'
  devise_for :users

  resources :trails, only: [:index, :show, :new]

  namespace :api do
    namespace :v1 do
      resources :trails, only: [:index, :show]
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

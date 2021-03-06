Rails.application.routes.draw do
  root 'trails#index'

  resources :trails, only: [:index, :show, :new, :create]
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :trails do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :trails, only: [:index, :show]
      resources :likes, only: [:create, :index]
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

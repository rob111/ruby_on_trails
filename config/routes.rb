Rails.application.routes.draw do
  root 'trails#index'
  devise_for :users
  # get "trails/:trail_id/reviews/:review_id/likes", to: "likes#create"

  resources :trails, only: [:index, :show, :new, :create]

  resources :trails, only: [:index, :show, :new] do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :trails, only: [:index, :show]
      resources :likes, only: [:create, :index]
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

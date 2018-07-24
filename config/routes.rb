Rails.application.routes.draw do
  root 'trails#index'
  devise_for :users
  resources :trails do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :trails, only: [:index, :show]
    end
  end
end

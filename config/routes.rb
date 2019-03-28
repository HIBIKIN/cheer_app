Rails.application.routes.draw do
  get 'users/show'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users

  resources :posts do
    resources :reviews, except: [:index, :show, :edit, :update]
  end

  resources :posts do
      resources :likes, only: [:create, :destroy]
    end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

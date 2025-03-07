Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end



  resources :books do
  resources :book_comments,only: [:create,:destroy]
  resource :favorite, only: [:create, :destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

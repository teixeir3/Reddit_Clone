Reddit::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :links do
    resources :comments, only: [:create, :new, :show]
  end
end

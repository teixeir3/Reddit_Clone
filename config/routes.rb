Reddit::Application.routes.draw do
  resources :users
  resource :session
  resources :subs
end

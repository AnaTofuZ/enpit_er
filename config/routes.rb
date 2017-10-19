Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get  '/help',  to:'static_pages#help'
  get  '/signup',  to:'users#new'
  resources :users
end

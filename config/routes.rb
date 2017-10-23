Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#home'

  get 'receipt/input'
  get  '/help',  to:'static_pages#help'
  resources :users
end

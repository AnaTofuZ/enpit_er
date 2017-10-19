Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
#  get  '/signup',  to:'users#new'
  resources :users
end

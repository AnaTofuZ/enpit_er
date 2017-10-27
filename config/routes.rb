Rails.application.routes.draw do
  root 'static_pages#home'

  get 'receipt/input'
  get  '/help',  to:'static_pages#help'
  get  '/list',  to:'static_pages#list'
  get  '/friends',  to:'static_pages#friends'
  get  '/recipe',  to:'static_pages#recipe'
  get  '/signup',  to:'users#new'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
  resources :users
  resource :profile ,except: :destroy
end

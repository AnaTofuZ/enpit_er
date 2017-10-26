Rails.application.routes.draw do
  get 'meeting_places/new'

  get 'receipt/input'

  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
  get  '/list',  to:'static_pages#list'
  get  '/friends',  to:'static_pages#friends'
  get  '/recipe',  to:'static_pages#recipe'
  get  '/signup',  to:'users#new'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
  resources :users
end

Rails.application.routes.draw do
  get 'static_pages/community'

  get 'static_pages/map'

  get 'receipt/input'

  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
  get  '/list',  to:'static_pages#list'
  get  '/map',  to:'static_pages#map'
  get  '/friends',  to:'static_pages#friends'
  get  '/recipe',  to:'static_pages#recipe'
  get  '/signup',  to:'users#new'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
  resources :users
end

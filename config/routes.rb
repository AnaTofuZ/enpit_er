Rails.application.routes.draw do
  get 'receipt/input'
  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
  get  '/list',  to:'static_pages#list'
  get  '/friends',  to:'static_pages#friends'
  get  '/recipe',  to:'static_pages#recipe'
  get  '/signup',  to:'users#new'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
  get 'static_pages/community'
  get 'static_pages/map'
  get 'receipt/input'
  get 'receipt/confrimate'
  resources :users
end

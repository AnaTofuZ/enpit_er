Rails.application.routes.draw do
  root 'static_pages#home'

  get 'receipt/input'
  get  '/help',  to:'static_pages#help'
  get  '/list',  to:'static_pages#list'
  get  '/friends',  to:'static_pages#friends'
  get  '/recipe',  to:'static_pages#recipe'
  get  '/signup',  to:'users#new'
  get  '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete  '/logout', to:'sessions#destroy'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'

  # commityな部分
  get 'static_pages/community'
  get 'static_pages/map'
  get 'receipt/input'

  resources :users
  resource :profile ,except: :destroy
end

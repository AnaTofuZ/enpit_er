Rails.application.routes.draw do
  get 'receipt/input'

  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
  get  '/signup',  to:'users#new'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
  resources :users
end

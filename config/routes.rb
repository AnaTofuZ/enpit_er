Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/help',  to:'static_pages#help'
  get  '/signup',  to:'users#new'
  resources :users
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'
end

Rails.application.routes.draw do


  root 'static_pages#home'
  get  '/about',  to:'static_pages#about'


  # User認証系のエンドポイント
  get  '/signup',  to:'users#new'
  get  '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete  '/logout', to:'sessions#destroy'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#token'
  get '/sending', to:'line_notify#sending'

# アプリケーション全体の機能
  get  '/help',  to:'static_pages#help'

scope '/community' do
     get  '/map',  to:'static_pages#map'
     get  '/map/:id',  to:'static_pages#friends', as: :map_id
     get  '/recipe',  to:'static_pages#recipe'
end

  # commityな部分
  get 'static_pages/community'
  get 'receipt/input'
  post 'receipt/confrimate', to:'receipt#confrimate'

  # item
  get 'items/new'
  get 'items/show'

  resources :users
  resource :profile ,except: :destroy
  resource :items
end

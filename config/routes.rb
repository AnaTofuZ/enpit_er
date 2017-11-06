Rails.application.routes.draw do
  root 'static_pages#home'


  # User認証系のエンドポイント
  get  '/signup',  to:'users#new'
  get  '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete  '/logout', to:'sessions#destroy'
  get '/authorize', to:'line_notify#authorize'
  post '/authorize', to:'line_notify#authorize'

# アプリケーション全体の機能
  get  '/help',  to:'static_pages#help'

scope '/community' do
     get  '/map',  to:'static_pages#map'
     get  '/map/:id',  to:'static_pages#map', as: :map_id
     get  '/recipe',  to:'static_pages#recipe'
end

  # commityな部分
  get 'static_pages/community'
  get 'receipt/input'
  get 'receipt/confrimate'


  resources :users
  resource :profile ,except: :destroy
end

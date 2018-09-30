Rails.application.routes.draw do
 # get 'camera/:id' => 'camera#take'
 # post 'camera' => 'camera#create'
 # get 'camera2' => 'camera#take2'
 # post 'camera2' => 'camera#create2'
 # get 'index/new' => 'camera#new'
 # post 'index/new' => 'camera#create3'
 # get 'index' => 'camera#index'
 
 
 resources :headlines do
  resources :pictures, only: [:create, :index]
 end
 

 
 # エクセルをheadlineにインポートする
 # resources :headlines, only: :new do
 #  collection { post :import }
 # end
end

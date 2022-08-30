Rails.application.routes.draw do

 devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }


 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 #トップ画面
 root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #ルーム


  resources :rooms do
   get :search, on: :collection
  end

resources :rooms

 #ルーム予約
 resources :reservations

 get "users/profile" => "users#profile"
 post  "users/profile" => "users#profile"
 get "users/account" => "users#account"

 resources :users


end

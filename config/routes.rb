Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "home/about" => "public/homes#about", as: "about"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get 'items/new'
  post 'items' => 'items#create'

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:index, :create, :new, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end

end

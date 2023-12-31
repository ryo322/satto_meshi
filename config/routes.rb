Rails.application.routes.draw do
  #管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #会員用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者側のルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :reports, only: [:index, :show, :update] do
      member do
        patch :confirm
      end
    end 
  end

# 会員側のルーティング
scope module: :public do
  root 'homes#top'
  get 'search', to: 'searches#search'

  resources :users, only: [:show, :edit, :update] do
    get 'favorited_posts', on: :member
    get 'confirm', on: :member
    patch 'withdraw', on: :collection
  end

  resources :posts do
  resource :favorite, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :reports, only: [:new, :create]
  end
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

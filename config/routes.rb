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

  # 管理者側のルーティング
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    end

# 会員側のルーティング
  scope module: :public do
    root to: 'homes#top'
    get 'search' => 'searches#search'
    get 'admin/search' => "searches#admin_search"
    get 'about' => 'homes#about'
    get 'users/mypage' => 'users#show'
    get 'users/infomation/edit' => 'users#edit'
    patch 'users/infomation' => 'users#update'
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdraw' => 'users#withdraw'
    resources :posts do
      resource :favorite, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

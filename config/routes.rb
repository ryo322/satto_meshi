Rails.application.routes.draw do
  namespace :admin do
    get 'comments/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'tags/create'
    get 'tags/edit'
    get 'tags/destroy'
    get 'tags/update'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'favorites/index'
    get 'favorites/show'
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/confirm'
    get 'users/withdraw'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
  end
  #管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  #会員用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

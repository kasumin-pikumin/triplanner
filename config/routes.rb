Rails.application.routes.draw do

  namespace :admin do
    root 'homes#top'
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}



  root to: "public/homes#top"
  get 'about' => 'public/homes#about'

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update , :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create]
    end
    resources :users, only: [:index, :edit, :update, :show] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
      member do
        get :favorites
      end
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :plans, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :public do
    get 'users/search'
    get 'posts/search'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

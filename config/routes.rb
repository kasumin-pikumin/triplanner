Rails.application.routes.draw do


  namespace :admin do
    root 'homes#top'
    resources :posts, only: [:index, :show]
    resources :users, only: [:index, :show, :edit, :update]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}




  root to: "homes#top"
  get 'about' => 'homes#about'

  scope module: :public do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update ,:destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
      member do
        get :favorites
      end
    end

  end

  namespace :public do
    get 'users/search'
  end

    get 'posts/search' => 'public/posts#search'
    get 'users/my_page' => 'public/users#show'
    get 'users/unsubscribe' => 'public/users#unsubscribe'
    delete 'users/withdraw' => 'public/users#withdraw'


  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

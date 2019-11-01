Rails.application.routes.draw do
  devise_for :users,controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resource :mypage do
    collection do
      get :top
      get :profile
      get :identification
      get :add_card
    end
  end

  resources :products, only: [:show,:destroy] do
    collection do
      get :sell
      get :search
    end
  end

  resources :home, only: [:show, :index] do
    collection do
      get 'logout'
    end
  end


  resources :signup do
    collection do
      get 'login_methods' #ログイン方法選択画面
      get 'registration' #会員情報入力
      post 'sms_confirmation' #電話番号認証
      post 'address' #住所入力
      post 'credit_card' #支払い方法
      get 'complete' #完了
    end
  end

  resource :transaction do
    collection do
      resources :buy,only:[:show] do
        collection do
          post 'purchase'
          get  'done'
        end
      end
    end
  end

  resources :images, only:[:create]

  resource :card, only: [:new, :create, :show] do
    collection do
      delete 'delete', to: 'cards#delete'
    end
  end
  
end
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :signup do
    collection do
      get 'registration' #会員情報入力
      get 'sms_confirmation' #電話番号認証
      get 'address' #住所入力
      get 'credit_card' #支払い方法
      get 'complete' #完了
    end
  end
end

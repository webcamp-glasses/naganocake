Rails.application.routes.draw do

  # 管理者側のルーティングを設定（namespaceで管理ファイルを棲み分け）
  namespace :admin do

     # scopeを用いてファイル構成を変えないまま任意のURLを指定する
    # devise_scope :admins do
    devise_for :admins do
      get '/admin/sign_in' => 'devise/sessions#new', as: :new_admin_session
      post '/admin/sign_in' => 'devise/sessions#create', as: :admin_session
      delete '/admin/sign_out' => 'devise/sessions#destroy', as: :destroy_admin_session
    end

    # トップページは「注文履歴の一覧画面」とする
    get '/' => 'homes#top'
    resources :orders, only: [ :show, :update ]
    get '/admin/orders/:id/order_details/:id' => 'order_details#update'
    resources :end_users, only: [ :index, :show, :edit, :update ]
    resources :products, except: [ :destroy ]
    resources :genres, only: [ :index, :create, :edit, :update ]
  end

  # 会員側のルーティングを設定（scpoe module:で管理ファイルを棲み分け）
  # scope moodule: :end_user do
  scope module: :end_user do

    # 必要なルーティングだけはかれるように設定
    devise_for :end_users, controllers: {
      registrations: 'end_users/registrations',
      sessions: 'end_users/sessions',
      passwords: 'end_users/passwords'
    }

    root 'homes#top'
    get '/about' => 'homes#about'

    # end_users_controller郡
    resource :end_users, only:[ :show, :edit, :update ] do
      collection do
        # 退会を確認する画面の表示
        get '/end_users/hide' => 'end_users#hide'
        # 退会処理を行うURLを設定
        patch '/end_users/out' => 'end_users#out'
      end
    end

    resources :addresses, only: [ :index, :create, :edit, :update, :destroy ]
    resources :products, only: [ :index, :show]

    # cart_items_controller郡
    resources :cart_items, only: [ :index, :create, :update, :destroy] do
      collection do
        # カートアイテムを全て削除
        delete '/cart_items/all_destroy' => 'cart_items#all_destroy'
      end
    end

    # orders_controller郡（orders#showはorder_detailsの詳細）
    resource :orders, only: [ :new, :index, :show, :create ] do
      collection do
        # 注文情報確認画面の表示
        get 'orders/confirm' => 'orders#confirm'
        # 注文完了画面の表示
        get 'orders/thanx' => 'orders#thanx'
      end
    end

  end

end

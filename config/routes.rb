Rails.application.routes.draw do


  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      passwords: 'admins/passwords'
    }

  # 管理者側のルーティングを設定（namespaceで管理ファイルを棲み分け）
  namespace :admins do
    # 管理者側のトップページ
    get '/' => 'homes#top'
    # トップページは「注文履歴の一覧画面」とする
    resources :orders, only: [ :show, :update ]
    patch '/orders/:order_id/order_details/:id' => 'order_details#update', as: 'order_detail_update'
    resources :end_users, only: [ :index, :show, :edit, :update ]
    resources :products, except: [ :destroy ]
    resources :genres, only: [ :index, :create, :edit, :update ]
  end

    # 必要なルーティングだけはかれるように設定
    devise_for :end_users, controllers: {
      registrations: 'end_users/registrations',
      sessions: 'end_users/sessions',
      passwords: 'end_users/passwords'
    }

  # 会員側のルーティングを設定（scpoe module:で管理ファイルを棲み分け）
  scope module: :end_user do

    # end_user側のトップページとアバウトページ
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    root 'products#index'

    # URLの重複があったため、別途指定
    get '/end_user/edit' => 'end_users#edit'
    get '/end_user' => 'end_users#show'
    put '/end_user' => 'end_users#update'

    # end_users_controller郡
    resource :end_users, only:[ :show, :edit, :update ] do
      collection do
        # 退会を確認する画面の表示
        get 'hide' => 'end_users#hide'
        # 退会処理を行うURLを設定
        post 'out'
        patch 'out'
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
    resources :orders, only: [ :new, :index, :show, :create ] do
      collection do
        # 注文情報確認画面の表示
        post 'orders/confirm' => 'orders#confirm'
        # 注文完了画面の表示
        get 'orders/thanx' => 'orders#thanx'
      end
    end

  end

end
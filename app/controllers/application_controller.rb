class ApplicationController < ActionController::Base

  # 管理者ページへの直打ちを制限する設定（要テスト！！！）
  #before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
    # ログイン後の遷移先の設定

    def after_sign_in_path_for(resource)
        case resource
        when Admin
            admins_path
        when EndUser
            end_users_path
        end
    end

    # ログアウト、退会した場合の遷移先
    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      #会員用の新規登録情報用
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :last_name, :first_name, :last_kana_name, :first_kana_name, :email, :postal_code, :address, :phone_number ])
      # 管理者用のログイン画面と会員側のサインイン画面用
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end

end

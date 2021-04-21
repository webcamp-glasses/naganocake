class EndUsers::EndUsersController < ApplicationController
  # before_action :authenticate_end_user!
  def show
    @end_user = current_end_user
  end

  def hide
  end

  def out
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
  end

  def update
    @end_user = current_end_user
      if @end_user.update(end_user_params)
        redirect_to end_users_path
      else
        render :edit
      end
  end
  
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :residence, :phone_numbar)
  end
  
end

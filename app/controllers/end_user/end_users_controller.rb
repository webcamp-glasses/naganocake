class EndUser::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def show
    @end_user = current_end_user
  end

  def hide
  end

  def out
    @end_user = current_end_user
    @end_user.update(is_deleted: "退会")
    reset_session
    redirect_to root_path
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
      if @end_user.update(end_user_params)
        redirect_to end_users_path
      else
        render :edit
      end
  end


  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :postal_code, :residence, :address, :phone_number, :is_deleted )
  end

end

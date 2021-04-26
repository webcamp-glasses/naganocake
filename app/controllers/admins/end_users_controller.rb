class Admins::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admins_end_user_path
    else
      render :edit
    end
  end


  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :postal_code, :address, :phone_number, :is_deleted, :email )
  end
end

class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    case params[:order_sort]
    when "0"
      @orders = Order.all.page(params[:page]).per(10)
    when "1"
      @end_user = EndUser.find(params[:end_user_id])
      @orders = @end_user.orders
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
  end

  def about
  end
end

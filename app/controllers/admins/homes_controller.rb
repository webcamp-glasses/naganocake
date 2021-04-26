class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def about
  end
end

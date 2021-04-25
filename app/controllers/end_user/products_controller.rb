class EndUser::ProductsController < ApplicationController

  include ApplicationHelper

  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @cart_items = CartItem.new
  end
end

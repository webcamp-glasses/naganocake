class EndUser::CartItemsController < ApplicationController

  include ApplicationHelper

  #before_action :authenticate_end_user!

  def index
    @cart_items = current_cart
  end

  def create
    @cart_item = current_end_user.cart_items.new(params_cart_item)
    @update_cart_item = CartItem.find_by(product: @cart_item.product)
    if @update_cart_item.present? && @cart_item.valid?
        @cart_item.quantity += @update_cart_item.quantity
        @update_cart_item.destroy
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def all_destroy
    @cart_items = current_cart
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private
    def params_cart_item
      params.require(:cart_item).permit(:quantity, :product_id)
    end
end
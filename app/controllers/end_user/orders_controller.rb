class EndUser::OrdersController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_end_user!
  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def confirm
    @order_items = OderDetail.all
  end

  def create
    @order = current_end_user.orders.new(order_params)
    @cart_items = current_cart
    @order.total_price = billing_amount(@order)
    if @order.save
      p "セーブ！！"
      p @order.errors.messages
    else
      p "セーブできませんでした"
      p @order.errors.messages
    end
    redirect_to orders_confirm_orders_path
      @cart_items.each do |cart_item|
        @order_items = @order.order_details.new
        @order_items.product_id = cart_item.product.id
        @order_items.product.name = cart_item.product.name
        @order_items.price = cart_item.product.price
        @order_items.quantity = cart_item.quantity
        @order_items.save
        current_cart.destroy_all
      end
  end

  def thanx
  end

  def index
  end

  def show
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :address, :postal_code, :name)
    end

    def sub_order_params
      params.require(:sub_order).permit(:address, :postal_code, :name)
    end

end

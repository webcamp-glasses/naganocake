class EndUser::OrdersController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_end_user!
  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def confirm
    @order_items = current_cart
    @order = Order.new(order_params)
    @order.total_price = total_price(@order_items)

    if params[:order][:selection_address] == "address"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = end_user_full_name(current_end_user)

    elsif params[:order][:selection_address] == "shipping_address"
      ship = Address.find_by(params[:order][:addresses_id])
      @order.postal_code = ship.postal_code
      @order.address = ship.address
      @order.name = ship.name

    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @ship = 1
    end
  end

  def create
    @order = current_end_user.orders.new(order_params)
    @cart_items = current_cart
    @order.save
    redirect_to orders_thanx_orders_path
      @cart_items.each do |cart_item|
        @order_items = @order.order_details.new
        @order_items.product_id = cart_item.product.id
        @order_items.product.name = cart_item.product.name
        @order_items.price = cart_item.product.price
        @order_items.quantity = cart_item.quantity
        @order_items.save
      end
      current_cart.destroy_all

  end

  def thanx
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
    def order_params
      params.require(:order).permit(:payment_method, :address, :postal_code, :name, :total_price)
    end

end

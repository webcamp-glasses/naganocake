class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      @order.order_details.each do |order_detail| 
        order_detail.update(product_status: "製作待ち")
      end
    end
    redirect_to request.referer
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

end

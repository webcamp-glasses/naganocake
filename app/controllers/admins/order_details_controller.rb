class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order

    if @order_detail.product_status == "製作中"
      @order_detail.order.update(order_status: "製作中")
    # 製作ステータスが全て製作完了になった場合、注文ステータスを配送準備中に自動更新するための条件分岐
    elsif @order_detail.product_status == "製作完了"
      if @order.order_details.all? { |order_detail| order_detail.product_status == "製作完了" }
        @order_detail.order.update(order_status: "発送準備中")
      end
    end

    redirect_to request.referer
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:product_status)
    end
end

class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :product

  # 製作ステータスの設定
  enum product_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  # 下記カラムは埋まってないとダメ
  validates :order_id, :product_id, :quantity, :price,
            prensence: true
  # 個数と購入時価格は整数型でないとダメ
  validates :quantity, :price, numericality: { integer_only: true }

  # 税込の商品価格と個数をかけた小計
  def sub_price
    (self.add_tax_price * quantity).round
  end
end

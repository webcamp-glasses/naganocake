class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_details

  # 支払い方法の選択
  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  # 注文ステータスの設定
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  # 下記カラムは埋めないとダメ
  validates :name, :postal_code, :address, :payment_method, :total_price,:shipping_price,
            presence: true
   # 郵便番号は整数型で７文字でないとダメ
  validates :postal_code, numericality: { only_integer: true }, length: {is: 7}
  # 請求額は整数型でないとダメ
  validates :shipping_price, :total_price, numericality: { only_integer: true }


end

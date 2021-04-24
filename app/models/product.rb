class Product < ApplicationRecord

  belongs_to :genre
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :cart_items

  attachment :image

  # 販売ステータスの設定
  enum is_active: { 販売中: true, 売り切れ: false }

  # ジャンルID、商品名、商品価格は埋まってないとダメ
  validates :genre_id, :name, :price, presence: true
  # 商品価格は整数型でないとダメ
  validates :price, numericality: { only_integer: true }

end

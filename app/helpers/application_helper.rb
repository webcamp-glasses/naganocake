module ApplicationHelper
  # 商品価格に消費税率をかけたものを定義
  def add_tax_price(price)
    (price * 1.1).round
  end
end

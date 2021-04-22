module ApplicationHelper
  

  def full_name
    (last_name + first_name).to_s
  end

  # 商品価格に消費税率をかけたものを定義
  def add_tax_price(price)
    (price * 1.1).round
  end
end

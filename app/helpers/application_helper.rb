module ApplicationHelper

  def add_tax_price(price)
    (price * 1.1).floor
  end

  def sub_price(sub)
    (add_tax_price(sub.product.price) * sub.quantity)
  end

  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end

  def billing_amount(order)
    total_price(current_cart) + order.shipping_price
  end

  def end_user_full_name(end_user)
    end_user.last_name + end_user.first_name
  end


end

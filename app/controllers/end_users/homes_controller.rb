class EndUsers::HomesController < ApplicationController
  def top
    @new_products = Product.limit(4).order("created_at DESC")
  end

  def about
  end
end

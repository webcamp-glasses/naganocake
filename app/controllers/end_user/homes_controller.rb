class EndUser::HomesController < ApplicationController
  def top
    @newproducts = Product.limit(4).order("created_at DESC")
  end

  def about
  end
end

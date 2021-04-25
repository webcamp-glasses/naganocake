class Admins::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      #商品を新規登録成功後その商品の詳細ページへ遷移
      redirect_to admins_product_path(@product)
    else
      #バリデーションに引っ掛かる場合は新規登録画面へ遷移
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # 商品編集変更保存後その商品の詳細ページへ遷移
      redirect_to admins_product_path(@product)
    else
      #バリデーションに引っ掛かる場合は新規登録画面へ遷移
      render :edit
    end
  end

  private

  def product_params
   params.require(:product).permit(:genre_id, :name, :description, :price, :image, :is_active)
  end

end

class EndUser::AddressesController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @addresses = current_end_user.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @addresses = current_end_user.address
    if @address.save
      flash.now[:notice] = "新規配送先を登録しました"
      redirect_to addresses_path
    end

  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    @addresses = current_end_user.address
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "配送先を変更しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
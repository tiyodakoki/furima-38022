class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
    
    
    
  end
  
  def create
  @item = Item.find(params[:item_id])
  @buyer_address = BuyerAddress.new(buyer_address_params)
  if @buyer_address.valid?
  @buyer_address = BuyerAddress.save
  redirect to root_path
 else
  render :index
  

  end
  end

  private
  def buyer_address_params
  params.require(:buyer_address).permit(:post_code, :region_id, :manicipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

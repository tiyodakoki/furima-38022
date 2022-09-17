class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path method: :show

    else
      render 'edit'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :information, :category_id, :condition_id, :postage_id, :region_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end

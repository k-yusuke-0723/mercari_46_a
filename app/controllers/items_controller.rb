class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.build_image
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to mypage_path(current_user.id)
    else
      render "items/new"
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :state,
      :delivery_fee_payer,
      :shipping_method,
      :shipping_source_area,
      :estimated_shipping_date,
      :price,
      image_attributes: [:image1]).merge(user_id: current_user.id)
  end

end

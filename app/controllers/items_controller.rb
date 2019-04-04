class ItemsController < ApplicationController
  before_action :editor_check, only: :edit
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @user = current_user
    redirect_to edit_user_registration_path unless @user.valid?
    @items = Item.order('id DESC').limit(4)
    @images = Image.order('id DESC').limit(4)
  end

  def show
  end

  def new
    @item = Item.new
    @item.build_image
  end

  def create
    @item = Item.new(item_params)
    @item.build_trade(trade_status: :exhibition)
    if @item.save
      redirect_to mypage_path(current_user.id)
    else
      render "items/new"
    end
  end

  def destroy
    item=Item.where(id:(params.require(:id)))
    trade=Trade.where(item_id:(params.require(:id)))
    image=Image.where(item_id:(params.require(:id)))
    if @item.user_id == current_user.id
      trade[0].delete
      image[0].delete
      item[0].delete
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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

  def editor_check
    @item = Item.find(params[:id])
    return redirect_to :root  unless (@item.user_id == current_user.id)
  end

end

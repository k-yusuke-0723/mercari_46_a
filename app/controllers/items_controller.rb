class ItemsController < ApplicationController

  def index
    @items = Item.order('id DESC').limit(4)
    @images = Image.order('id DESC').limit(4)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
    end
  end

end

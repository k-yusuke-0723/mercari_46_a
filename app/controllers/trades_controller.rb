class TradesController < ApplicationController

  def new
      @item = Item.find(params[:item_id])
  end

  def purchase
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params['pay_val'], card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end

end

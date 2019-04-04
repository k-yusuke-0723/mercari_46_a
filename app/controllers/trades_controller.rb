class TradesController < ApplicationController

  def new
      @item = Item.find(params[:item_id])
  end

  def purchase
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: params['pay_val'], card: params['payjp-token'])
    redirect_to root_path, notice: "支払いが完了しました"
  end

  def productbuy
    @trade=Trade.where(item_id:(params.require(:item_id)))
    @trade[0].trade_status = 2
    @trade[0].save
    redirect_to root_path, notice: "購入が完了しました"
  end

end

class BuyController < ApplicationController
  require 'payjp'
  before_action :set_card

  def show
    @postal = current_user.addresses[0].getPostalCode
    @address = current_user.addresses[0].getAddress
    @fullname = current_user.getFullname
    @item = Item.find(params[:id])
    @shipping = @item.getShippingCharge

    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card_information = customer.cards.retrieve(@card.card_id)
    session[:amount]   = @item.price
    # session[:customer_id] = customer.id
  end

  def purchase#https://pay.jp/docs/api/?ruby#支払いを作成
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
      :amount       => session[:amount],
      :customer     => @current_user.cards[0].customer_id,
      :currency     => 'jpy',
    )
    redirect_to root_path , flash: {buy_item: "商品を購入しました"}
  end


  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end

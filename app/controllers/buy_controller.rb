class BuyController < ApplicationController
  require 'payjp'
  before_action :set_card, if: :user_signed_in?
  before_action :authenticate_user!
  before_action :redirect_root, except: :purchase

  def show
    @item = Item.find(params[:id])
    if current_user
      @postal = current_user.addresses[0].getPostalCode
      @address = current_user.addresses[0].getAddress
      @fullname = current_user.getFullname
      @shipping = @item.getShippingCharge
    
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      session[:amount]   = @item.price
      session[:item_id] = @item.id
    end
  end

  def purchase#https://pay.jp/docs/api/?ruby#支払いを作成
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
      :amount       => session[:amount],
      :customer     => @current_user.cards[0].customer_id,
      :currency     => 'jpy',
    )
    #購入時exhibision_stateを1にする
    Item.find(session[:item_id]).update_attribute(:exhibision_state, 1)
    #購入時buyer_idにcurrent_user.idを追加
    Item.find(session[:item_id]).update_attribute(:buyer_id, current_user.id)
    redirect_to root_path , flash: {buy_item: "商品を購入しました"}
  end


  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
  
  def redirect_root#出品商品のuser_idとcurrent_user.idが同じの際、rootへ行く。ルーティングはは商品詳細ページに変えてもいい
    # binding.pry
    item = Item.find(params[:id])
    if item.user_id==current_user.id
      redirect_to root_path
    end
  end

end

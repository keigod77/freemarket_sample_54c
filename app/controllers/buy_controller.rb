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
    binding.pry
  end


  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

end

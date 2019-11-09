class MypagesController < ApplicationController
  before_action :authenticate_user!

  def top
  end
  
  def show
  end

  def profile
  end
  
  def identification
  end

  def add_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end
end

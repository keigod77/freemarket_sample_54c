class CardController < ApplicationController
  require "payjp"

  def new#カード登録
    card = Card.where(user_id: current_user.id)
    redirect_to action: "index" if card.present?
  end

  def create#payjpとcardのデータ作成
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else#https://pay.jp/docs/api/?ruby
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def show

  end
end

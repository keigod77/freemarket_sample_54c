class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def new#カード登録
    redirect_to add_card_mypage_path if @card.present?
  end

  def create#payjpとcardのデータ作成

    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else#https://pay.jp/docs/api/?ruby, https://pay.jp/docs/payjs
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

  def show#https://pay.jp/docs/api/?ruby#顧客情報を取得
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def delete
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.delete
    if @card.destroy
      flash[:notice] = "削除しました"
      redirect_to action: "new"
    else
      redirect_to action: "show", notice: "削除できませんでした"
    end
  end

  private
  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end

class SignupController < ApplicationController
  before_action :no_layout_action
  before_action :prefectures , only: :address

  def registration
    @user = User.new
  end

  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email]  =user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name_knaji] = user_params[:family_name_knaji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]
    @user = User.new

  end

  def credit_card
    session[:postal_code] = user_params[:postal_code]
    session[:prefectures] = user_params[:prefectures]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    @user = User.new
  end

  def complete
    session[:card_number] = user_params[:card_number]
    session[:credit_card_month] = user_params[:credit_card_month]
    session[:credit_card_year] = user_params[:credit_card_year]
    session[:security_code] = user_params[:security_code]
  end

  def create
  end

  private
  def no_layout_action
    render layout: false
  end

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :family_name_knaji, 
      :first_name_kanji, 
      :family_name_kana, 
      :first_name_kana, 
      :birthday_year,
      :birthday_month,
      :birthday_day,
      :phone_number,
      :postal_code,
      :prefectures,
      :city,
      :address,
      :building,
      :card_number,
      :credit_card_month,
      :credit_card_year,
      :security_code
    )
  end
end

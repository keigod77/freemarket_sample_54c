class SignupController < ApplicationController
  before_action :no_layout_action, except: :create
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
    session[:user_id] = @user.id
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end

  def credit_card
    session[:postal_code] = addresses_params[:postal_code]
    session[:prefectures] = addresses_params[:prefectures]
    session[:city] = addresses_params[:city]
    session[:address] = addresses_params[:address]
    session[:building] = addresses_params[:building]
    @user = User.new
  end

  def complete

  end

  def create
    @user = User.create(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name_knaji: session[:family_name_knaji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:],
      birthday_day,
      phone_number,
    )
    @address = Address.create(

    )
    
    redirect_to complete_signup_index_path
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
    )
  end
  def addresses_params
    params.require(:address).permit(
      :postal_code,
      :prefectures,
      :city,
      :address,
      :building,
    )
  end
end

class SignupController < ApplicationController
  layout :false
  # before_action :prefectures , only: :address

  def registration
    @user = User.new
  end

  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email]  =user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new
  end

  def address
    session[:phone_number] = user_params[:phone_number]
    @address = Address.new
  end

  def credit_card
    session[:postal_code] = addresses_params[:postal_code]
    session[:prefectures] = addresses_params[:prefectures]
    session[:city]        = addresses_params[:city]
    session[:address]     = addresses_params[:address]
    session[:building]    = addresses_params[:building]
    @user = User.new
  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.create(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_number: session[:phone_number],
    )
    session[:id] = @user.id
    @address = Address.new(
      user_id: session[:id],
      postal_code: session[:postal_code],
      prefectures: session[:prefectures],
      city: session[:city],
      address: session[:address],
      building: session[:building],
    )
    if @address.save
      redirect_to complete_signup_index_path
    else
      User.find(session[:id]).destroy
      render '/signup/registration'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
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

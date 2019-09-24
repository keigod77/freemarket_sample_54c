class SignupController < ApplicationController
  before_action :no_layout_action
  before_action :prefectures , only: :address

  def registration
    @user = User.new
  end

  def sms_confirmation
    @user = User.new
  end

  def address
  end

  def credit_card
  end

  def complete
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
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
    )
  end
end

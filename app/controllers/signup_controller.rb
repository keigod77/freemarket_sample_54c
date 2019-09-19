class SignupController < ApplicationController
  before_action :no_layout_action

  def registration
  end

  def sms_confirmation
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
end

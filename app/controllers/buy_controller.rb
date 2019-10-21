class BuyController < ApplicationController

  def show
    @postal = current_user.addresses[0].getPostalCode
    @address = current_user.addresses[0].getAddress
    @fullname = current_user.getFullname
  end

end

class BuyController < ApplicationController

  def show
    info = current_user.addresses[0]
    @postal = "〒" + info.postal_code
    @address = info.prefectures + " " + info.city + " " + info.address + " " + info.building
    @fullname = current_user.last_name + " " + current_user.first_name
  end

end

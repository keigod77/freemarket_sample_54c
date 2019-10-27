class HomeController < ApplicationController

  def index
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    binding.pry
  end

  def logout
  end
  
end

class ImagesController < ApplicationController

  def create
    Image.create(image: params[:image],
                 item: @item.id
                )
  end
end

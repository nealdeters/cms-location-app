class Api::V1::ImagesController < ApplicationController

  def index
    @images = current_user.brands.find(params[:brand_id]).images
  end

end

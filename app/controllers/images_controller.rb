class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_brand
  layout "cms_locations_layout"

  def index
    if current_user.brands.exists?(params[:brand_id])
      @images = @brand.images.all
    else
      redirect_to "/"
    end
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end
end

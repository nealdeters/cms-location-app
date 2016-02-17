class ImagesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_brand
  layout "cms_locations_layout"

  def index
    if current_user.brands.exists?(params[:brand_id])
      @images = @brand.images.all

      if params[:search]
        @images = @brand.images.search(params[:search])
      else
        @images = @brand.images.all
      end
    else
      redirect_to "/"
    end
  end

  def new

  end

  def create
    @image = @brand.images.create({ 
      image_name: params[:image_name],
      image_category: params[:image_category]
      })
    
    flash[:success] = "New Image Created"

    redirect_to brand_image_path
  end

  def show
    @image = @brand.images.find(params[:id])
  end

  def edit
    @image = @brand.images.find(params[:id])
  end

  def update
    @image = @brand.images.find(params[:id])

    @image.update({ 
      image_name: params[:image_name],
      image_category: params[:image_category]
      })

    flash[:info] = "Image Updated"

    redirect_to brand_image_path
  end

  def destroy
    @image = @brand.images.find(params[:id])
    @image.destroy

    flash[:danger] = "Image Deleted"

    redirect_to brand_image_path
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end
end

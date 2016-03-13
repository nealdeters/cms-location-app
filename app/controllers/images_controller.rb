class ImagesController < ApplicationController
  before_action :authenticate_user!, :load_brand
  layout "cms_locations_layout"

  def index
    if current_user.brands.exists?(params[:brand_id])
      @images = @brand.images.all

      if params[:search]
        @images = @brand.images.search(params[:search])
      else
        @images = @brand.images.all
      end

      if params[:filter] && params[:filter_order]
        @images = @images.order(params[:filter] => params[:filter_order])
      end
    else
      redirect_to "/"
    end
  end

  def new
    @image = Image.new
  end

  def create

    @image = @brand.images.new({ 
      image_name: params[:image_name],
      image_category: params[:image_category],
      image: params[:image],
      image_path: params[:image_path]
      })

    if @image.save

      flash[:success] = "New Image Created"

      redirect_to brand_images_path

    else
      render :new
    end
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
      image_category: params[:image_category],
      image: params[:image],
      image_path: params[:image_path]
      })

    if @image.save

      flash[:info] = "Image Updated"

      redirect_to brand_images_path

    else
      render :edit
    end
  end

  def destroy
    @image = @brand.images.find(params[:id])
    @image.destroy

    flash[:danger] = "Image Deleted"

    redirect_to brand_images_path
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end
end
class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_brand
  layout "cms_locations_layout"

  def index
    if current_user.brands.exists?(params[:brand_id])
      @contents = @brand.contents.all

      if params[:search]
        @contents = @brand.contents.search(params[:search])
      else
        @contents = @brand.contents.all
      end

      if params[:filter] && params[:filter_order]
        @contents = @contents.order(params[:filter] => params[:filter_order])
      end
    else
      redirect_to "/"
    end

    # if params[:filter] && params[:filter_order]
    #   @locations = Location.order(params[:filter] => params[:filter_order])
    # end
  end

  def new
    @content = Content.new
  end

  def create
    @content = @brand.contents.create({ 
      content_name: params[:content_name],
      content_category: params[:content_category],
      content_field: params[:content_field]
      })

    if @content.save
    
      flash[:success] = "New Content Created"

      redirect_to brand_contents_path

    else
      render :new
    end
  end

  def show
    @content = @brand.contents.find(params[:id])
  end

  def edit
    @content = @brand.contents.find(params[:id])
  end

  def update
    @content = @brand.contents.find(params[:id])

    @content.update({ 
      content_name: params[:content_name],
      content_category: params[:content_category],
      content_field: params[:content_field]
      })

    if @content.save

      flash[:info] = "Content Updated"

      redirect_to brand_contents_path

    else
      render :edit
    end
  end

  def destroy
    @content = @brand.contents.find(params[:id])
    @content.destroy

    flash[:danger] = "Content Deleted"

    redirect_to brand_contents_path
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end
end
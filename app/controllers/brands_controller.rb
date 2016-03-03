class BrandsController < ApplicationController
  
  before_action :authenticate_user!
  layout "cms_brands_layout"

  def index
    @brands = current_user.brands.all

    if params[:search]
      @brands = current_user.brands.search(params[:search])
    else
      @brands = current_user.brands.all
    end

    if params[:filter] && params[:filter_order]
        @brands = @brands.order(params[:filter] => params[:filter_order])
    end

  end

  def new

  end

  def create
    @brand = Brand.new({ 
      brand_name: params[:brand_name],
      brand_address_1: params[:brand_address_1],
      brand_address_2: params[:brand_address_2],
      brand_city: params[:brand_city],
      brand_state: params[:brand_state],
      brand_zipcode: params[:brand_zipcode],
      brand_phone_number: params[:brand_phone_number],
      brand_business_description: params[:brand_business_description],
      brand_service_description: params[:brand_service_description],
      brand_industry: params[:brand_industry],
      })
 
    if @brand.save
      flash[:success] = "New Brand Created"

      BrandUser.new(user_id: current_user.id, brand_id: @brand.id)

      redirect_to brand_path
    else
      render :new
    end
  end

  def show
    @brand = Brand.find(params[:id])

    redirect_to brand_path
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])

    @brand.update({ 
      brand_name: params[:brand_name],
      brand_address_1: params[:brand_address_1],
      brand_address_2: params[:brand_address_2],
      brand_city: params[:brand_city],
      brand_state: params[:brand_state],
      brand_zipcode: params[:brand_zipcode],
      brand_phone_number: params[:brand_phone_number],
      brand_business_description: params[:brand_business_description],
      brand_service_description: params[:brand_service_description],
      brand_industry: params[:brand_industry]
      })
    
    flash[:info] = "Brand Updated"

    redirect_to brand_path
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    flash[:danger] = "Brand Deleted"

    redirect_to brand_path
  end
end

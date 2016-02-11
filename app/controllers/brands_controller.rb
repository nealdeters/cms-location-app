class BrandsController < ApplicationController
  
  before_action :authenticate_user!
  layout "cms_brands_layout"

  def index
    @brands = current_user.brands.all
    #Find all brands associated to a specific user
    # @brands = current_user.brands.all
  end

  def new

  end

  def create
    @brand = Brand.create({ 
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

    BrandUser.create(user_id: current_user.id, brand_id: @brand.id)
    
    flash[:success] = "New Brand Created"

    redirect_to "/brands"
  end

  def show
    #need to search for the brand and go to it's locations index
    @brand = Brand.find(params[:id])

    # @location = Location.find(params[:id])

    redirect_to "brands/#{@brand.id}/locations"
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.update({ 
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

    redirect_to "/brands"
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    flash[:danger] = "Brand Deleted"

    redirect_to '/brands'
  end

  def search
    @brands = Brand.where("brand_name LIKE ?", "%#{params[:search]}%")

    render :index
  end
end

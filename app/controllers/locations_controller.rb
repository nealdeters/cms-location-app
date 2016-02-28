class LocationsController < ApplicationController

  before_action :authenticate_user!, :load_brand, :load_image
  layout "cms_locations_layout"

  def index
    
    if current_user.brands.exists?(params[:brand_id])
      @locations = @brand.locations.all

      if params[:search]
        @locations = @brand.locations.search(params[:search])
      else
        @locations = @brand.locations.all
      end

      if params[:filter] && params[:filter_order]
        @locations = @locations.order(params[:filter] => params[:filter_order])
      end
    else
      redirect_to "/"
    end
  end

  def new

  end

  def create
    @location = @brand.locations.create({ 
      business_name: params[:business_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      phone_number: params[:phone_number],
      hours_of_operation: params[:hours_of_operation],
      business_description: params[:business_description],
      service_description: params[:service_description],
      areas_served: params[:areas_served],
      zipcodes_served: params[:zipcodes_served],
      languages: params[:languages],
      meta_description: params[:meta_description],
      meta_keywords: params[:meta_keywords],
      meta_title: params[:meta_title],
      meta_url: params[:meta_url]
      })
    
    flash[:success] = "New Location Created"

    redirect_to brand_location_path
  end

  def show
    @location = @brand.locations.find(params[:id])

    render :layout => 'webpage'
  end

  def edit
    @location = @brand.locations.find(params[:id])
    # @location = Location.find(params[:brand_id])
  end

  def update
    @location = @brand.locations.find(params[:id])

    @location.update({ 
      business_name: params[:business_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      phone_number: params[:phone_number],
      hours_of_operation: params[:hours_of_operation],
      business_description: params[:business_description],
      service_description: params[:service_description],
      areas_served: params[:areas_served],
      zipcodes_served: params[:zipcodes_served],
      languages: params[:languages],
      meta_description: params[:meta_description],
      meta_keywords: params[:meta_keywords],
      meta_title: params[:meta_title],
      meta_url: params[:meta_url]
      })

    # update location image
    if @location.images.first != nil
      @location.images.first.update( 
        image_name: params[:image_name],
        image_category: params[:image_category],
        image: params[:image]
        # image_path: params[:image_path]
      )
    else
      @location.images.create( 
         image_name: params[:image_name],
         image_category: params[:image_category],
         image: params[:image]
         # image_path: params[:image_path]
       )
    end

    flash[:info] = "Location Updated"

    redirect_to brand_location_path
  end

  def destroy
    @location = @brand.locations.find(params[:id])
    @location.destroy

    flash[:danger] = "Location Deleted"

    redirect_to brand_location_path
  end

  def directory
    @locations = @brand.locations.all
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end

  def load_image
    @image = Image.find_by(imageable_id: params[:imageable_id])
  end

end

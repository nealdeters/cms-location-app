class LocationsController < ApplicationController

  before_action :authenticate_user!
  before_filter :load_brand
  layout "cms_locations_layout"

  def index
    # @locations = Location.all
    # @locations = current_user.locations.all
    @locations = @brand.locations.all

    if params[:filter] && params[:filter_order]
      @locations = Location.order(params[:filter] => params[:filter_order])
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
      meta_url: params[:meta_url],
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
      meta_url: params[:meta_url],
      })

    flash[:info] = "Location Updated"

    redirect_to brand_location_path
  end

  def destroy
    @location = @brand.locations.find(params[:id])
    @location.destroy

    flash[:danger] = "Location Deleted"

    redirect_to brand_location_path
  end

  def search
    @locations = @brand.locations.where("business_name LIKE ? OR city LIKE ? OR state LIKE ? OR id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")

    render :index
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end

end

class LocationsController < ApplicationController
  before_action :load_brand, :except => [:show, :send_mail]
  layout :resolve_layout

  def index
    :authenticate_user!

    if current_user.brands.exists?(params[:brand_id])
      # @locations = @brand.locations.all
      
      @locations = @brand.locations

      if params[:search]
        @locations = @brand.locations.search(params[:search])
      else
        @locations.all
      end

      if params[:filter] && params[:filter_order]
        @locations = @locations.order(params[:filter] => params[:filter_order])
      end
    else
      redirect_to "/"
    end
  end

  def directory
    @locations = Brand.find(params[:brand_id]).locations.all
    @states = []

    @locations.each do |location|
      @states << location.state
    end 

    @states = @states.uniq!
    @states.sort_by!{ |state| state }

    render template: "layouts/directory"
  end

  def new
    :authenticate_user!
    @location = Location.new
  end
  
  def create
    :authenticate_user!

    @location = @brand.locations.create({ 
      business_name: params[:business_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      email: params[:email],
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
      tagline_title: params[:tagline_title],
      tagline_summary: params[:tagline_summary]
      })
    
    flash[:success] = "New Location Created"

    redirect_to brand_locations_path
  end

  def show
    @location = Location.find(params[:id])

    render :layout => 'webpage'
  end

  def edit
    :authenticate_user!

    @location = Location.find(params[:id])
    # @location = Location.find(params[:brand_id])
  end

  def update
    :authenticate_user!

    @location = @brand.locations.find(params[:id])

    @location.update({ 
      business_name: params[:business_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      email: params[:email],
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
      tagline_title: params[:tagline_title],
      tagline_summary: params[:tagline_summary]
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

    redirect_to brand_locations_path
  end

  def destroy
    :authenticate_user!

    @location = @brand.locations.find(params[:id])
    @location.destroy

    flash[:danger] = "Location Deleted"

    redirect_to brand_locations_path
  end

  def send_mail
    # @location = @brand.locations.find(params[:id])

    name = params[:name]
    email = params[:email]
    body = params[:comments]
    location_email = params[:location_email]

    LocationPageMailer.welcome_email(name, email, body, location_email).deliver

    flash[:success] = "Message sent"

    redirect_to location_path
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end

  def resolve_layout
    case action_name
    when "index", "edit", "new", "create"
      "cms_locations_layout"
    when "directory"
      "directory"
    end
  end

end

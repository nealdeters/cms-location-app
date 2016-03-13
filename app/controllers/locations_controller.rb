class LocationsController < ApplicationController
  before_action :load_brand, :except => [:show, :send_mail]
  before_action :authenticate_user!, :only => [:index, :directory, :new, :create, :edit, :update, :destroy]
  layout :resolve_layout

  def index

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

    respond_to do |format|
      format.html
      format.csv { send_data @locations.to_csv }
      # format.xls { send_data @locations.to_csv(col_sep: "\t") }
    end

  end

  def import
    @import = Location.import(params[:file])

    flash[:success] = "Locations imported."

    redirect_to brand_locations_path
  end

  def import_export

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
    @location = Location.new
  end
  
  def create

    @location = @brand.locations.new({ 
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

    if @location.save
    
      flash[:success] = "New Location Created"

      redirect_to brand_locations_path

    else
      render :new
    end
  end

  def show
    # give brand a url attr, view button url points to brand#url from db, url dns redirects to your heroku, before_action locations#show find location by slug or id, find location’s brand, if request.url doesn’t match brand#url, don’t let them in

    @location = Location.friendly.find(params[:id])

    render :layout => 'webpage'
  end

  def edit

    @location = Location.find(params[:id])
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
      tagline_summary: params[:tagline_summary],
      slug: params[:slug]
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

    @location = @brand.locations.find(params[:id])
    @location.destroy

    flash[:danger] = "Location Deleted"

    redirect_to brand_locations_path
  end

  def send_mail

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
    when "index", "edit", "new", "create", "import_export"
      "cms_locations_layout"
    when "directory"
      "directory"
    end
  end

end

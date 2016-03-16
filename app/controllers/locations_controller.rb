class LocationsController < ApplicationController
  before_action :load_brand, :except => [:show, :send_mail]
  before_action :authenticate_user!, :only => [:index, :directory, :new, :create, :edit, :update, :destroy]
  # before_action :restrict_location_pages, :only => :show
  layout "cms_locations_layout", except: :show

  def index

    @searchPlaceholder = "Search Locations"

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
      # redirect_to "locations.<%= @brand.brand_url %>/directory
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

  # def directory
    
  # end

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
    if params[:id] == "directory"
      # @locations = Location.friendly.find(params[:id]).brands.locations.all
      @brand = Brand.find_by(brand_url: request.domain)

      if @brand
        @locations = @brand.locations.all

        render layout: "directory"
      end
    else
      @location = Location.friendly.find(params[:id])

      if request.domain != @location.brand.brand_url
        render :file => "#{Rails.root}/public/404.html",  :status => 404
      else
        render :layout => 'webpage'
      end

    end
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

    @location = Location.find(params[:id])

    name = params[:name]
    email = params[:email]
    body = params[:comments]
    location_email = params[:location_email]

    LocationPageMailer.welcome_email(name, email, body, location_email).deliver

    flash[:success] = "Message sent"

    if @location.slug
      redirect_to "/#{@location.slug}"
    else
      redirect_to "/#{@location.id}"
    end
  end

  private

  def load_brand
    @brand = Brand.find(params[:brand_id])
  end

end

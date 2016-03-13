class Api::V1::LocationsController < ApplicationController

  def index
    @locations = current_user.brands.find(params[:brand_id]).locations
  end

end

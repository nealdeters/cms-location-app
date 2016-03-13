class Api::V1::BrandsController < ApplicationController

  def index
    @brands = current_user.brands.all
  end

end

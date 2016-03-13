class Api::V1::ContentsController < ApplicationController

  def index
    @contents = current_user.brands.find(params[:brand_id]).contents
  end

end

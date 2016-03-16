class PagesController < ApplicationController
  layout "application"
  before_action :restrict_directory_page, :only :show

  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def contact_email

    name = params[:name]
    email = params[:email]
    body = params[:message]

    ContactEmailMailer.contact_email(name, email, body).deliver

    flash[:success] = "Message sent"

    redirect_to "/contact"
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end

  def restrict_directory_page
    @brand_url = Brand.find_by(brand_url: request.domain)

    if @brand_url
      redirect_to "locations/directory"
    end
  end
end

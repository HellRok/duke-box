class ApplicationController < ActionController::Base

  private

  def send_to_https
    if request.protocol == 'http://' && Rails.env.production?
      url = URI.parse(request.original_url)
      url.scheme = 'https'
      redirect_to url.to_s
    end
  end
end

class HomeController < ApplicationController
  def index
    send_to_https
  end

  def csrf_token
    render body: form_authenticity_token
  end
end

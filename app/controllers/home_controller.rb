require 'open-uri'

class HomeController < ApplicationController
  def index
  end

  def csrf_token
    render body: form_authenticity_token
  end
end

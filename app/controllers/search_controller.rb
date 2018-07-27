class SearchController < ApplicationController
  def index
    query = CGI.escape(params['query'])
    search_params = [
      "q=#{query}",
      "maxResults=50",
      "part=snippet",
      "type=video",
      "key=#{ENV.fetch('YOUTUBE_API_KEY')}"
    ]
    results = open("https://www.googleapis.com/youtube/v3/search?#{search_params.join('&')}").read

    render json: results
  end
end

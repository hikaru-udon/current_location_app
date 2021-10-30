class SearchController < ApplicationController
  require 'net/http'

  def index
    # puts '---------'
    # puts params[:shop_name]
    if shop_name = params[:shop_name]
      params = URI.encode_www_form({keyword: shop_name})
      uri = URI.encode("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=261324dd569a9418&name=#{shop_name}")
      # puts uri.class
      uri = URI.parse(uri)
      response = Net::HTTP.get_response(uri)
      json = response.body
      result = JSON.parse(json)
      puts result
      if result["results"]
        @shop_name = result["results"][0]["name"]
      end
    end
  end

  def search
    
  end

end

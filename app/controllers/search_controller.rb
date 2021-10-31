class SearchController < ApplicationController
  require 'net/http'

  def index
    # puts '---------'
    # puts params[:shop_name]
    if shop_name = params[:shop_name]
      params = URI.encode_www_form({name: shop_name})
      uri = URI.encode("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=261324dd569a9418&name=#{shop_name}")
      puts "-------"
      puts params
      puts "-------"
      uri = URI.parse(uri)
      response = Net::HTTP.get_response(uri)
      #xml形式で受け取っているので、json形式に変化する
      json = response.to_json
      result = JSON.parse(json)
      puts "-------"
      puts result
      puts "-------"
      if result["results"]
        @shop_name = result["results"][0]["name"]
      end
    end
  end

  def search
    
  end

end

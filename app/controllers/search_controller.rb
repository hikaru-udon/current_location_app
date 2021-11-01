class SearchController < ApplicationController
  
  def index
    require 'net/http'

    if shop_name = params[:shop_name]
      params = URI.encode_www_form({name: shop_name})
      uri = URI.encode("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=261324dd569a9418&name=#{shop_name}&count=10&format=json")
      uri = URI.parse(uri)
      response = Net::HTTP.get_response(uri)
      #Jsonデータを解析し、Rubyで取り出すためにHash形式に変換
      hash = JSON.parse(response.body)
      @shops = hash["results"]["shop"]
      # binding.pry
    end

  end

  def search
    
  end

end

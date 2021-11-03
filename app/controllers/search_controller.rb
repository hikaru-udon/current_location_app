class SearchController < ApplicationController
  
  def index
    require 'net/http'

    if shop_name = params[:shop_name] 
      params = URI.encode_www_form({name: shop_name})
      encode_uri = URI.encode("https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=261324dd569a9418&name=#{shop_name}&count=100&format=json")
      uri = URI.parse(encode_uri)
      response = Net::HTTP.get_response(uri)
      #Json形式のデータを解析し、Rubyで取り出すためにHash形式に変換
      hash = JSON.parse(response.body)
      @shops = hash["results"]["shop"]
    end

  end

  def search
    
  end

end

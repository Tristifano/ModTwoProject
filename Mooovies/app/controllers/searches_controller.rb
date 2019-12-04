require 'rest-client'
class SearchesController < ApplicationController
    def index
        @keyword = params[:keyword]
        if @keyword
            @results = search_api_call(@keyword)
        end 
    end

    private

    def search_api_call(keyword)
       response =  RestClient.get("http://www.omdbapi.com/?s=#{keyword}&type=movie&apikey=3f96a270")
       results_hash = JSON.parse(response.body)
       results_array =  results_hash["Search"]
    end
end
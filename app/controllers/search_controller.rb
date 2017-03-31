class SearchController < ApplicationController

  def create
    if params[:q]
      @songs = SearchService.new(params[:q]).general_search
    else
      @songs = SearchService.new(params).term_search
    end
    @songs
  end

end

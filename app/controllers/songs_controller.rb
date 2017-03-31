class SongsController < ApplicationController
  def index
  end

  def show
    @song = Song.includes(:artist, :album).find(params[:id])
  end

end

class SongsController < ApplicationController
  def index
  end

  def show
    @song = Song.includes(:artist, :album).find(params[:id])
    @song_spotify_info = RSpotify::Track.search(@song.name).first
  end

end

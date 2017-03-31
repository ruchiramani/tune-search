class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @artist_spotify_info = RSpotify::Artist.search(@artist.name).first
  end
end

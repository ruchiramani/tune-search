class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    @album_spotify_info = RSpotify::Album.search(@album.name).first
  end
end

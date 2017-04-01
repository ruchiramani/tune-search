
artists = ['Drake', 'Adele', 'Coldplay', 'Khalid','Future','Calvin Harris', 'Katy Perry','Nicky Jam', 'U2','Wolfmother','Kygo','Justin Bieber','DNCE','Sia','Rihanna']

artists.each do |artist|
  artist_info = RSpotify::Artist.search(artist).first
  new_artist = Artist.find_or_create_by(name: artist_info.name)
  artist_albums = artist_info.albums
  artist_albums.each do |album|
    new_album = Album.find_or_create_by(name: album.name, artist_id: new_artist.id)
    album.tracks.each do |song|
      new_song = Song.find_or_create_by(name: song.name,artist_id: new_artist.id, album_id: new_album.id)
    end
  end
end

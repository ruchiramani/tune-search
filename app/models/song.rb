class Song < ApplicationRecord
  belongs_to :album
  belongs_to :artist
  scope :search_by_artist, -> (artist){ joins(:artist).where('artists.name LIKE ?', artist.strip).includes(:artist, :album) }
  scope :search_by_album, -> (album) { joins(:album).where('albums.name LIKE ?', album.strip).includes(:artist, :album)}
  scope :search_by_song, -> (song) { where('name LIKE ?', song.strip).includes(:artist, :album) }
  scope :search_by_artist_album, -> (artist, album) { joins(:album).where('albums.name LIKE ?', album.strip).joins(:artist).where('artists.name LIKE ?',artist.strip).includes(:artist, :album)}
  scope :search_by_artist_song, -> (artist, song) { where('songs.name LIKE ?', song.strip).joins(:artist).where('artists.name LIKE ?', artist.strip).includes(:artist, :album)}
  scope :search_by_album_song, -> (album, song) { where('songs.name LIKE ?', song.strip).joins(:album).where('albums.name LIKE ?', album.strip).includes(:artist, :album)}
  scope :search_by_all, -> (artist, album, song) { where('songs.name LIKE ?', song.strip).joins(:artist).where('artists.name LIKE ?', artist.strip).joins(:album).where('albums.name COLLATE utf8_general_ci LIKE ?', album.strip).includes(:album, :artist)}
end

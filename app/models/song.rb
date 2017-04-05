class Song < ApplicationRecord
  validates :name, presence: true
  belongs_to :album
  belongs_to :artist
  scope :search_by_artist, -> (artist){ joins(:artist).where('artists.name ILIKE ? ', '%' + artist.strip + '%').includes(:artist, :album) }
  scope :search_by_album, -> (album) { joins(:album).where('albums.name ILIKE ?','%' + album.strip + '%').includes(:artist, :album)}
  scope :search_by_song, -> (song) { where('name  ILIKE ?', '%' + song.strip + '%').includes(:artist, :album) }
  scope :search_by_artist_album, -> (artist, album) { joins(:album).where('albums.name  ILIKE ?', '%' + album.strip + '%').joins(:artist).where('artists.name ILIKE ?','%' + artist.strip + '%').includes(:artist, :album)}
  scope :search_by_artist_song, -> (artist, song) { where('songs.name  ILIKE ?','%' + song.strip + '%').joins(:artist).where('artists.name  ILIKE ?','%' + artist.strip + '%').includes(:artist, :album)}
  scope :search_by_album_song, -> (album, song) { where('songs.name  ILIKE ?', '%' +song.strip + '%').joins(:album).where('albums.name  ILIKE ?', '%' + album.strip + '%').includes(:artist, :album)}
  scope :search_by_all, -> (artist, album, song) { where('songs.name  ILIKE ?','%' + song.strip + '%').joins(:artist).where('artists.name  ILIKE ?','%' + artist.strip + '%').joins(:album).where('albums.name ILIKE ?','%' + album.strip + '%').includes(:album, :artist)}
end

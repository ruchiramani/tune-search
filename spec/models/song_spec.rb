require "rails_helper"

RSpec.describe Song, :type => :model do

 adele = Artist.find_by(name: 'Adele')
 album = Album.find_by(name: '25')

  context "creates a new song" do
    song = Song.create(name:'Rolling in the deep', artist_id: adele.id, album_id: album.id)
    it 'should be valid' do
      expect(song).to be_valid
    end
  end

  context "doesn't create a new song without a name" do
    song = Song.create(artist_id: adele.id, album_id: album.id, name: '')
    it 'should_not be valid' do
      expect(song).to_not be_valid
    end
    it 'requires a name' do
      expect(song.errors[:name]).to match_array (["can't be blank"])
    end
  end

  context "doesn't create a new song without an artist id and album id" do
    song = Song.create(name: 'Skyfall')
    it 'should_not be valid' do
      expect(song).to_not be_valid
    end
    it 'requires an artist id' do
      expect(song.errors[:artist]).to match_array (["must exist"])
    end
    it 'requires an album id' do
      expect(song.errors[:album]).to match_array (["must exist"])
    end
  end

  context "it searches all the songs by Artist name" do
    artist_songs = Song.search_by_artist('adele')
    adele_songs = adele.songs
    it "returns all songs by artist name" do
      expect(artist_songs).to eq(adele_songs)
    end
  end
  context "it searches all the songs by album name" do
    album_songs = Song.search_by_album('25')
    album_25_songs = album.songs
    it "returns all songs by album name" do
      expect(album_songs).to eq(album_25_songs)
    end
  end
  context "it searches all the songs by song name" do
    songs = Song.search_by_song('passionfruit')
    hello = Song.find_by(name: 'passionfruit')
    it "returns all songs by song name" do
      expect(songs).to match_array([hello])
    end
  end

  context "it searches all the songs by album and artist name" do
    artist_album_songs = Song.search_by_artist_album('adele', '25')
     songs_by_album_artist = Song.where(artist_id: adele.id, album_id: album.id)
    it "returns all songs by artist and album name" do
      expect(artist_album_songs).to match_array(songs_by_album_artist)
    end
  end
  context "it searches all the songs by album and song name" do
    album_song_name = Song.search_by_album_song('25','hello')
    songs_by_name_album = Song.where(name: 'hello', album_id: album.id)
    it "returns all songs by album and song name" do
      expect(album_song_name).to match_array(songs_by_name_album)
    end
  end
  
  context "it searches all the songs by artist and song name" do
    artist_song_name = Song.search_by_artist_song('adele','hello')
    songs_by_name_artist = Song.where(name: 'hello', artist_id: adele.id)
    it "returns all songs by artist and song name" do
      expect(artist_song_name).to match_array(songs_by_name_artist)
    end
  end

  context "it searches all the songs by artist, album and song name" do
    artist_album_song_name = Song.search_by_all('adele','25','hello')
    songs_by_name_artist_album = Song.where(name: 'hello', artist_id: adele.id, album_id: album.id)
    it "returns all songs by artist, album and song name" do
      expect(artist_album_song_name).to match_array(songs_by_name_artist_album)
    end
  end



end

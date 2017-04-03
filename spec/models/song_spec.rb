require "rails_helper"

RSpec.describe Song, :type => :model do
  adele = Artist.create!(name: 'Adele')
  album_25 = Album.create!(name: '25', artist_id: adele.id)
  album_skyfall = Album.create(name: 'skyfall', artist_id: adele.id)
  album_25_songs = []
  album_skyfall_songs = []
  adele_songs = []
  skyfall = Song.create(name: 'skyfall', artist_id: adele.id, album_id: album_skyfall.id)
  adele_songs << skyfall
  album_skyfall_songs << skyfall
  hello = Song.create(name: 'hello', artist_id: adele.id, album_id: album_25.id)
  adele_songs << hello
  album_25_songs << hello

  context "creates a new song" do
    song = Song.create(name:'Rolling in the deep', artist_id: 1, album_id: 1)
    adele_songs << song
    album_25_songs << song
    it 'should be valid' do
      expect(song).to be_valid
    end
  end

  context "doesn't create a new song without a name" do
    song = Song.create(artist_id: 1, album_id: 1, name: '')
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
    it "returns all songs by artist name" do
      expect(artist_songs).to eq(adele_songs)
    end
  end
  context "it searches all the songs by album name" do
    album_songs = Song.search_by_album('25')
    it "returns all songs by album name" do
      expect(album_songs).to eq(album_25_songs)
    end
  end
  context "it searches all the songs by song name" do
    songs = Song.search_by_song('hello')
    it "returns all songs by song name" do
      expect(songs).to eq([hello])
    end
  end

  context "it searches all the songs by album and artist name" do
    artist_album_songs = Song.search_by_artist_album('adele', '25')
    it "returns all songs by artist and album name" do
      expect(artist_album_songs).to eq(album_25_songs)
    end
  end
  context "it searches all the songs by album and song name" do
    album_song_name = Song.search_by_album_song('25','hello')
    it "returns all songs by album and song name" do
      expect(album_song_name).to eq([hello])
    end
  end

  context "it searches all the songs by artist and song name" do
    artist_song_name = Song.search_by_artist_song('adele','skyfall')
    it "returns all songs by artist and song name" do
      expect(artist_song_name).to eq([skyfall])
    end
  end

  context "it searches all the songs by artist, album and song name" do
    artist_album_song_name = Song.search_by_all('adele','25','hello')
    it "returns all songs by artist, album and song name" do
      expect(artist_album_song_name).to eq([hello])
    end
  end



end

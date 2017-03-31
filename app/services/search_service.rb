class SearchService

  attr_accessor :songs, :search_term

  def initialize(search_term)
    @songs = []
    @search_term = search_term
  end

  def general_search
    @songs += Song.search_by_artist(search_term)
    @songs += Song.search_by_album(search_term)
    @songs += Song.search_by_song(search_term)
    @songs.uniq!
    @songs
  end

  def term_search
     if artist? && !album? && !song?
       @songs += Song.search_by_artist(search_term['artist'])
     elsif artist? && album? && !song?
       @songs += Song.search_by_artist_album(search_term['artist'], search_term['album'])
     elsif artist? && !album? && song?
       @songs += Song.search_by_artist_song(search_term['artist'], search_term['song'])
     elsif artist? && album? && song?
       @songs += Song.search_by_all(search_term['artist'],search_term['album'],search_term['song'])
     elsif album? && !artist? && !song?
      @songs += Song.search_by_album(search_term['album'])
    elsif album? && !artist? && song?
      @songs += Song.search_by_album_song(search_term['album'], search_term['song'])
    elsif song? && !artist? && !album?
      @songs += Song.search_by_song(search_term['song'])
    end
    @songs
  end

  def artist?
    search_term['artist'].strip != ''
  end

  def album?
    search_term['album'].strip != ''
  end

  def song?
    search_term['song'].strip != ''
  end

end

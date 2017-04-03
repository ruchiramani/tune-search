# require 'test_helper'
#
# class SongTest < ActiveSupport::TestCase
#   test "should not save song without name" do
#     song = Song.new
#     assert_not song.save, "Saved the song without a name"
#   end
#
#   test 'should save with a name, artist_id, album_id' do
#     song = Song.new(name: 'Hello', artist_id: Artist.first.id, album_id: Album.first.id)
#     assert song.save, "Saved the song"
#   end
#
#   test 'should return songs by name' do
#     songs = Song.search_by_song('Hello')
#     assert songs
#   end
#
#   test 'should return songs by name and artist' do
#     songs = Song.search_by_artist_song('Adele', 'Hello')
#   end
#
#
# end

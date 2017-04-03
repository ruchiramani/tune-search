require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

test "should not save album without name and artist id" do
  album = Album.new
  assert_not album.save, "Saved the album without a name"
end

test 'should save with a name and artist id' do
  binding.pry
  album = Album.new(name: '25', artist_id: Artist.first.id)
  assert album.save, "Saved the album"
end

end

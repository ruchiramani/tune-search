require "rails_helper"

RSpec.describe Album, :type => :model do
  drake = Artist.find_by(name: 'Drake')

  context "creates a new album" do
    album = Album.create(name:'A head full of dreams', artist_id: drake.id)
    it 'should be valid' do
      expect(album).to be_valid
    end
  end

  context "doesn't create a new album without a name" do
    album = Album.create(name: '', artist_id: drake.id)
    it 'should_not be valid' do
      expect(album).to_not be_valid
    end
    it 'requires a name' do
      expect(album.errors[:name]).to match_array (["can't be blank"])
    end
  end

  context "doesn't create a new album without an artist id" do
    album_two = Album.create(name: 'A head full of dreams')
    it 'should_not be valid' do
      expect(album_two).to_not be_valid
    end
    it 'requires an artist id' do
      expect(album_two.errors[:artist]).to match_array (["must exist"])
    end
  end
end

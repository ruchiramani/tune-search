require "rails_helper"

RSpec.describe Artist, :type => :model do

  context "creates a new artist" do
    artist = Artist.create(name:'Coldplay')
    it 'should be valid' do
      expect(artist).to be_valid
    end
  end

  context "doesn't create a new artist without a name" do
    artist = Artist.create(name: '')
    it 'should_not be valid' do
      expect(artist).to_not be_valid
    end
    it 'requires a name' do
      expect(artist.errors[:name]).to match_array (["can't be blank"])
    end
  end
end

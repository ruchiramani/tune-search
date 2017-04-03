require "rails_helper"

RSpec.feature "song show", :type => :feature do
  song = Song.find(1)
  describe "song" , js: true do
    it "shows song information" do
      visit "/songs/1"
      expect(page).to have_content('free smoke')
    end
    it "can visit song's artist page" do
      visit "/songs/1"
      click_link('artist')
      expect(current_path).to eql(artist_path(song.artist_id))
      expect(page).to have_content('Drake')
    end
    it "can visit song's album page" do
      visit "/songs/1"
      click_link('album')
      expect(current_path).to eql(album_path(song.album_id))
      expect(page).to have_content('More Life')
    end
  end
end

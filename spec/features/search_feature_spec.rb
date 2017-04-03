require "rails_helper"

RSpec.feature "songs search", :type => :feature do
  describe "search" , js: true do
    it "can search by name of the song" do
      visit "/"
      fill_in "q", :with => "Hello"
      click_button "Search"
      expect(page).to have_content('hello Adele')
    end
    it "can search by name of the artist" do
      visit "/"
      fill_in "q", :with => "adele"
      click_button "Search"
      expect(page).to have_content('hello Adele')
    end
    it "can search by name of the album" do
      visit "/"
      fill_in "q", :with => "25"
      click_button "Search"
      expect(page).to have_content('hello Adele')
    end
  it "can search by name of the album and song" do
    visit "/"
    fill_in "album", :with => "25"
    fill_in "song", :with => "hello"
    click_button "Submit"
    expect(page).to have_content('hello Adele 25')
  end
  it "can search by name of the artist and song" do
    visit "/"
    fill_in "artist", :with => "adele"
    fill_in "song", :with => "hello"
    click_button "Submit"
    expect(page).to have_content('hello Adele 25')
  end
  it "can search by name of the album and song" do
    visit "/"
    fill_in "album", :with => "25"
    fill_in "artist", :with => "adele"
    click_button "Submit"
    expect(page).to have_content('hello Adele 25')
  end
  it "can search by name of the album and song" do
    visit "/"
    fill_in "album", :with => "25"
    fill_in "artist", :with => "adele"
    fill_in "song", :with => "hello"
    click_button "Submit"
    expect(page).to have_content('hello Adele 25')
  end
end
end

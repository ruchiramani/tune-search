require "rails_helper"

RSpec.describe ArtistsController, :type => :controller do
  artist = Artist.find(1)
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: artist.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, params: { id: artist.id }
      expect(response).to render_template("show")
    end

  end
end

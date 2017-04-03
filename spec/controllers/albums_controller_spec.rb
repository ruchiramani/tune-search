require "rails_helper"

RSpec.describe AlbumsController, :type => :controller do
  album = Album.find(1)
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, params: { id: album.id }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, params: { id: album.id }
      expect(response).to render_template("show")
    end

  end
end

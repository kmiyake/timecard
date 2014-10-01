require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET 'index'" do
    it "redirects to dashboard url if user logged in" do
      alice = create(:alice)
      sign_in alice
      get :index
      expect(response).to redirect_to dashboard_url
    end

    it "render template home#index" do
      get :index
      expect(response).to render_template "index"
    end
  end
end

require "rails_helper"

RSpec.describe DashboardsController, type: :controller do
  describe "GET 'show'" do
    it "returns root unless user logged in" do
      get :show
      expect(response).to redirect_to root_url
    end

    it "renders template dashboard#show if user logged in" do
      alice = create(:alice)
      sign_in alice
      get :show
      expect(response).to render_template "show"
    end
  end
end

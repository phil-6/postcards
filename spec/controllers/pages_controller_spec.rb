require 'rails_helper'

RSpec.describe PagesController, type: :controller do


  describe "GET #main" do
    before {get :main}
    let!(:pc) { FactoryBot.create(:postcard) }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "responds to html by default" do
      expect(response.content_type).to eq "text/html"
    end

    it "expects there to be some postcards" do
      # TODO: Fix This test
      # expect(:postcards).to contain(:pc)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_profile" do
    user = FactoryBot.create(:user)
    #let!(:other_users) { Fabricate.time(2, :User) }
    # :user_profile, params:{id: user.id}

    it "returns http success" do
      subject {get "/users/#{user.id}"}
      expect(response).to have_http_status(:success)
    end
  end

end

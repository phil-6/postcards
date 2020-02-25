require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #main" do
    it "returns http success" do
      get :main
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_profile" do
    it "returns http success" do
      get :user_profile
      expect(response).to have_http_status(:success)
    end
  end

end

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
    let(:user_id) { Fabricate(:User, username: 'Twa').id }
    let!(:other_users) { Fabricate.time(2, :User) }
    it "returns http success" do

      get :users/:user_id
      expect(response).to have_http_status(:success)
      expect(response.body.username).to eq('Twa')
    end
  end

end

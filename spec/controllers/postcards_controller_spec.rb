require 'rails_helper'

RSpec.describe PostcardsController, type: :controller do
  let!(:postcard) { FactoryBot.create(:postcard) }
  describe "GET #index" do
    #it "returns http success" do
    #  get :index
    #  expect(response).to have_http_status(:success)
    #end
    #it "expects there to be some postcards" do
    #  get :index
    #  expect(@postcards.count).to be > 0
    #end
  end

  describe "POST postcards#create" do
    # TODO: Fix this
    #it "requires login" do
    #  post :create, contact: FactoryGirl.attributes_for(:contact)
    #  expect(response).to redirect_to login_url
    #end
    # TODO: Fix this
    #it "creates a new postcard" do
    #  expect{ post :create, postcard: FactoryBot.attributes_for(:postcard) }.to change(Postcard, :count).by(1)
    #end
  end

end

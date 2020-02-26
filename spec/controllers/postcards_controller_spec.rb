require 'rails_helper'

RSpec.describe PostcardsController, type: :request do
  include Devise::Test::IntegrationHelpers

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
    let(:params) { { postcard: { message: 'abc', from_location: 'abc', image_link: 'www.fart.com' } } }
    let(:user) { FactoryBot.create(:user) }

    subject { post '/postcards', params: params }

    before { sign_in user }

    it "creates a new postcard" do
      expect{ subject }.to change(Postcard, :count).by(1)
        # expect(response.body).to include('abc')
    end
  end
end

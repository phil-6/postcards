require 'rails_helper'

RSpec.describe User, type: :request do
  include Devise::Test::IntegrationHelpers
  let(:params) { {user: { username: 'abc77', email: 'abc7@abc.com', password: 'password', password_confirmation: 'password' }, host: 'localhost:3000'} }
  subject { post '/users', params: params }

  it "should create a new user" do
    expect{ subject }.to change(User, :count).by(1)
  end

  # it "should make account inactive when user is soft deleted" do
  #
  # end
end

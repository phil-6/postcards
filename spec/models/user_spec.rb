require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user_attrs = attributes_for(:user)
  end

  it "should create a new instance of a user given valid attributes" do
    user = User.new(@user_attrs)
    user.save
  end

  it "should make account inactive when user is soft deleted" do

  end
end

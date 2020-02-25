class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:main, :about]
  before_action :set_user, only: :user_profile
  def main
    @postcards = Postcard.all
  end

  def about
  end

  def user_profile
    @user
    @sent_postcards_count = Postcard.where(:user_id => @user.id).size
    @received_postcards_count = Postcard.where(:sent_to => @user.id).size
    @sent_postcards = Postcard.where(:user_id => @user.id)
    @received_postcards  = Postcard.where(:sent_to => @user.id)
    render template: "pages/user_profile"

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end

class PostcardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :api_index, :api_show]
  before_action :set_postcard, only: [:show,:api_show, :update, :destroy]

  # GET /postcards
  def index
    @postcards = Postcard.all
  end

  # GET /api/postcards
  def api_index
    @postcards = Spot.all
    render json: @postcards.as_json()
  end

  # GET /postcards/:id
  def show
    @postcard
  end

  # GET /api/postcards/:id
  def api_show
    @postcard
    render json: @postcard.as_json()
  end

  # GET /postcards/new
  def new
    @postcard = Postcard.new
  end

  # POST /postcards
  def create
    @postcard = current_user.postcards.new(postcard_params)
    @postcard.sent_to = (User.all(:select => :id).collect(&:id)).sample
    @postcard.sent_at = Date.today

    if @postcard.save!
      redirect_to "/users/"+current_user.id.to_s, notice: "Postcard Sent!"
      # PostcardMailer.with(postcard: @postcard).new_postcard_email.deliver_now
    else
      render 'new', alert: "Something Went Wrong, Please try again."
    end
    #TODO Add Response
  end

  # # GET /postcards/:id/edit
  # def edit
  #   @postcard = Postcard.find(params[:id])
  # end
  #
  # # PUT /postcards/:id
  # def update
  #   # @spot.update(spot_params)
  #   #TODO Add Response
  #
  #   @postcard = Postcard.find(params[:id])
  #
  #   if @postcard.update(postcard_params)
  #     redirect_to @postcard
  #   else
  #     render 'edit'
  #   end
  # end

  # # DELETE /postcards/:id
  # def destroy
  #   @postcards.destroy
  #   #TODO Add Response
  # end

  private

  def postcard_params
    # whitelist params
    params.require(:postcard).permit(:message, :from_location, :image_link)
  end

  def set_postcard
    @postcard = Postcard.find(params[:id])
  end

end

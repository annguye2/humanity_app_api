class WhitecardsController < ApplicationController
  before_action :set_whitecard, only: [:show, :update, :destroy]

  # GET /whitecards
  def index
    @whitecards = Whitecard.all

    render json: @whitecards
  end

  # GET /whitecards/1
  def show
    render json: @whitecard
  end

  # POST /whitecards
  def create
    @whitecard = Whitecard.new(whitecard_params)

    if @whitecard.save
      render json: @whitecard, status: :created, location: @whitecard
    else
      render json: @whitecard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /whitecards/1
  def update
    if @whitecard.update(whitecard_params)
      render json: @whitecard
    else
      render json: @whitecard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /whitecards/1
  def destroy
    @whitecard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whitecard
      @whitecard = Whitecard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def whitecard_params
      params.require(:whitecard).permit(:answer, :rating, :category, :player)
    end
end

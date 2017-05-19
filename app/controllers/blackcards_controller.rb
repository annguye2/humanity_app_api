class BlackcardsController < ApplicationController
  before_action :set_blackcard, only: [:show, :update, :destroy]

  # GET /blackcards
  def index
    @blackcards = Blackcard.all

    render json: @blackcards.to_json(include: :whitecards)
  end

  # GET /blackcards/1
  def show
    render json: @blackcard.to_json(include: [:whitecards, :scores])
  end

  # POST /blackcards
  def create
    @blackcard = Blackcard.new(blackcard_params)

    if @blackcard.save
      render json: @blackcard, status: :created, location: @blackcard
    else
      render json: @blackcard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blackcards/1
  def update
    if @blackcard.update(blackcard_params)
      render json: @blackcard
    else
      render json: @blackcard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blackcards/1
  def destroy
    @blackcard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blackcard
      @blackcard = Blackcard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blackcard_params
      params.require(:blackcard).permit(:question, :rating, :category, :pick, :player_won)
    end
end

class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_player, except: [:login, :create, :index]

  # GET /players
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created#, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  def login
    player = Player.find_by(username: params[:player][:username])
    if player && player.authenticate(params[:player][:password])
      token = create_token(player.id, player.username)
      render json: {status: 200, token: token, player: player}
    else
      render json: {status: 401, message: "Unauthorized"}
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:name, :password, :email, :img, :high_score)
# <<<<<<< HEAD
#
# =======
    end

    def create_token(id, username)
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
      {
        exp: (Time.now + 30.minutes).to_i,
        iat: Time.now.to_i,
        iss: ENV['JWT_ISSUER'],
        player: {
          id: id,
          username: username
        }
      }
# >>>>>>> 7bc6f9c3dbe2b84a43928302b0b45d9d6561b8f0
    end
end

class ApplicationController < ActionController::API

  def authenticate_token
    puts "AUTHENTICATE JWT"
    render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
  end

  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]

    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    puts token = JWT.decode(token_input, ENV['JWT_SECRET'], true)
    JWT.decode(token_input, ENV['JWT_SECRET'], true)
    rescue
    render json: { status: 401, message: 'Unauthorized'}
  end

  def get_current_player
    return if !bearer_token
    decode_jwt =decode_token(bearer_token)
    Player.find(decode_jwt[0]["player"]["id"])
  end

  def authorize_player
    puts "AUTHORIZE PLAYER"
    puts "player id: #{get_current_player.id}"
    puts "params: #{params[:id]}"
    render json: { status: 401, message: "Unauthorized"} unless get_current_player.id == params[:id].to_i
  end

end

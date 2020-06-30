class PlayersController < ApplicationController

  before_action :require_login # Before action will be executed ensure that user is logged in

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    # fail   # can be used to double check the form params being passed into by the incoming request

    # player = Player.new
    # player.first_name = params[:player][:first_name]
    # player.last_name = params[:player][:last_name]
    player = Player.new(player_params)

    if player.save
      # redirect_to "/players"
      redirect_to players_path
    else
      flash[:errors] = player.errors.full_messages
      # redirect_to "/players/new" #the route where we came from, the so called 'back' route
      redirect_back fallback_location: "/players/new"
      # redirect_to :back #the route where we came from, the so called 'back' route
    end
  end

  def show
    # fail
    @player = Player.find(params[:id])
  end

  def edit
    # fail
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update(player_params)
      # redirect_to "/players"
      # redirect_to :root
      redirect_to players_path
    else
      flash[:errors] = player.errors.full_messages
      # redirect_to "/players/#{player.id}/edit"
      # redirect_to :back #the route where we came from, the so called 'back' route
      redirect_back fallback_location: players_path
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    # redirect_to "/players"
    redirect_to players_path
  end

  private
  def player_params
    params.require(:player).permit(:first_name, :last_name) # Only expect those params being passed in from the incoming POST request
  end

end

class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all.order("created_at DESC")
  end

  def show
  end

  def new
    @player = current_user.players.build
  end

  def create
    @player = current_user.players.build(player_params)

    if @player.save
      redirect_to @player
    else
      render 'form'
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

  private
  def find_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :position, :school, :bio, :highlight, :image, :transcript, :sat_scores)
  end

end

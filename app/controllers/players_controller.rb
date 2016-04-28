class PlayersController < ApplicationController
  before_action :find_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all.order("created_at DESC")
  end

  def show
  end

  def new
    @player = Player.new

  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player
    else
      render 'form'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :position, :school, :bio, :highlight, :image, :transcript, :sat_scores)
  end

end

class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :authenticate_user!, only: %i[show]
  before_action :set_game, only: %i[show]

  def create
    game = current_user.games.create
    redirect_to(game)
  end

  def show; end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end

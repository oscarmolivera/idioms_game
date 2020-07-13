class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :authenticate_user!, only: %i[create]
  before_action :authorize_user!, only: %i[create]

  def create
    @checker = Words::CheckAnswer.new(word, answer, game).call
    respond_to { |format| format.js {} }
  end

  def game
    Game.find(params[:answer][:game_id])
  end

  def word
    Word.find(params[:answer][:word_id])
  end

  def answer
    params[:answer][:content]
  end

  private

  
  def authorize_user!
    authorize game
  end
end

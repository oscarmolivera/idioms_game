class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :authorize_user!, only: %i[create]

  def create
    checker = Words::CheckAnswer.new(word, answer, game).call
    redirection(checker)
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

  def redirection(checker)
    return redirect_back(fallback_location: game_path(game), notice: t('game.good_answer')) if checker

    redirect_back(fallback_location: game_path(game), alert: t('game.bad_answer'))
  end

  def authorize_user!
    authorize game
  end
end

class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    checker = Words::CheckAnswer.new(word, answer, game).call
    redirect_back(fallback_location: game_path(game), notice: 'That is Correct!') if checker
    redirect_back(fallback_location: game_path(game), alert: 'Sorry, Try Again!') unless checker
  end

  def game
    Game.find(params[:answer][:game])
  end

  def word
    Word.find(params[:answer][:word])
  end

  def answer
    params[:answer][:content]
  end

  def message(checker)
    return 'Good answer' if checker == true

    'Bad answer'
  end
end

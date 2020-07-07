class WordsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy
  before_action :set_word, only: %i[edit show update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @pagy,  @words = pagy(Word.all, page: params[:page], items: 8)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    user_for_translations(@word)
    if @word.save
      redirect_to(words_path)
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    @word.assign_attributes(word_params)
    user_for_translations(@word)
    if @word.save
      redirect_to(word_path(@word))
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to @word
  end

  private

  def word_params
    params.require(:word)
          .permit(
            :content,
            :language_id,
            translations_attributes: %i[id content language_id _destroy]
          )
  end

  def set_word
    @word = Word.find(params[:id])
  end

  def authorize_user!
    authorize @word
  end

  def user_for_translations(word)
    word.translations.each do |translation|
      translation.user = current_user
    end
  end

end

module Words
  class CheckAnswer
    def initialize(word, answer, game)
      @word = word
      @answer = answer
      @game = game
    end

    def call
      update_game_stats(success: valid_answer?)
      valid_answer?
    end

    private

    attr_reader :word, :answer, :game

    def update_game_stats(success:)
      return game.increment!(:good_answers_count) if success == true

      game.increment!(:bad_answers_count)
    end

    def valid_answer?
      @valid_answer ||= word.translations.map(&:content).include?(answer)
    end
  end
end

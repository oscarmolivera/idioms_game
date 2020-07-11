module Words
  class CheckAnswer
    def initialize(word, answer)
      @word = word
      @answer = answer
    end

    def call
      validate_answer
    end

    private

    attr_reader :word, :answer

    def validate_answer
      word.translations.map(&:content).include?(answer)
    end
  end
end

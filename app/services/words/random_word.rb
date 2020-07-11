module Words
  class RandomWord
    def call
      random_word
    end

    private

    def random_word
      Word.joins(:translations).order(Arel.sql('RAND()')).first
    end
  end
end

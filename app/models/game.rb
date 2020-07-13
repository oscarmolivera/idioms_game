class Game < ApplicationRecord
  belongs_to :user

  def correctness
    return '-' if total_answers.zero?

    value = (good_answers_count.to_f / total_answers) * 100
    value = value.round(2)
    value.to_s + '%'
  end

  private

  def total_answers
    good_answers_count + bad_answers_count
  end
end

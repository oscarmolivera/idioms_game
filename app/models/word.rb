class Word < ApplicationRecord
  belongs_to :language
  belongs_to :user

  has_many :translations_association, class_name: 'Translation'
  has_many :translations, through: :translations_association, source: :translated_word, dependent: :destroy
  has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_word_id'
  has_many :inverse_translations, through: :inverse_translations_association, source: :word

  validates :content, :language, presence: true
  validate :word_translations

  accepts_nested_attributes_for :translations, allow_destroy: true

  def usermail
    user.email.gsub(/.{0,3}@/, '***@').split('@').first
  end

  private

  # Validates that a word language can not be the same as the translation language.
  def word_translations
    return if translations.none? { |tr| tr.language == language }

    errors.add(:language, 'Translation must be in a different language')
  end
end

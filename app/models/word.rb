class Word < ApplicationRecord
  belongs_to :language
  
  validates :content, :language, presence: true
  validates :language, inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name) }
end

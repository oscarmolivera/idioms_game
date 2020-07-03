class Word < ApplicationRecord
  belongs_to :language
  belongs_to :user
  
  validates :content, :language, presence: true
  # validates :language, inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name) }
end

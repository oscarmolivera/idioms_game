require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'initial columns' do
    it { is_expected.to have_db_column(:content) }
    it { is_expected.to have_db_column(:language_id) }
  end

  describe 'nested forms' do
    it { is_expected.to accept_nested_attributes_for(:translations).allow_destroy(true) }
    
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:language) }

    describe '#word_translations' do
      let(:english) { create(:language) }
      let(:word_english) { build(:word, language: english) }
      
      context 'when word translation is in same language' do
        let(:word_english2) { build(:word, language: english) }

        before { word_english.translations = [word_english2] }

        it 'denies to save the translation' do
          expect(word_english).not_to be_valid  
        end
      end

      context 'when word translation is in different language' do
        let(:spanish) { create(:language, :spanish) }
        let(:word_spanish) { build(:word, language: spanish) }
        before { word_english.translations = [word_spanish] }
        
        it 'allows to save the translation' do
          expect(word_english).to be_valid
        end
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:user) }

    it do
      is_expected.to have_many(:translations_association).class_name('Translation')
    end
    it do
      is_expected.to have_many(:translations)
        .through(:translations_association)
        .source(:translated_word)
    end
    it do
      is_expected.to have_many(:inverse_translations_association)
        .class_name('Translation')
        .with_foreign_key('translated_word_id')
    end
    it do
      is_expected.to have_many(:inverse_translations)
        .through(:inverse_translations_association)
        .source(:word)
    end
  end

  describe '#usermail' do
    let(:user) { build(:user, email: 'testsubject@email.com') }
    let(:word) { create(:word, user: user)}
    
    # Dos pruebas iguales  con diferentes codigos.
    subject { word.usermail }
    
    it { is_expected.to eq('testsubj***') }

    it 'mask the user mail' do
      subject
      expect(word.usermail).to eq('testsubj***')
    end
  end
end

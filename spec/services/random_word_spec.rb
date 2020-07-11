require 'rails_helper'

RSpec.describe Words::RandomWord do
  describe '#call' do

    context 'when word has no translations' do
      subject { described_class.new.call }    
      let!(:word) { create(:word) }

      it 'does not gives any word' do
        expect(subject).to eq(nil)
      end
    end

    context 'when word has any translations' do
      subject { described_class.new.call }    
      let!(:word) { create(:word, :with_translations) }

      it 'does not gives any word' do
        expect(subject).to eq(word)
      end
    end
  end

end

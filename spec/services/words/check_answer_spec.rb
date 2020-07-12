require 'rails_helper'

RSpec.describe Words::CheckAnswer do
  let!(:word) { create(:word, :with_translations) }
  let!(:game) { create(:game) }
  
  describe '# call' do
    subject { described_class.new(word, answer, game).call }

    context 'when good answer is provided' do
      let(:answer) { word.translations.first.content}
    
      it { expect(subject).to be(true)}

      it 'update good answers stats' do
        expect { subject }.to change { game.reload.good_answers_count }.by(1)
      end
    end

    context 'when bad answer is provided' do
      let(:answer) { 'Georgia'}
    
      it { expect(subject).to be(false) }

      it 'update bad answers stats' do
        expect { subject }.to change { game.reload.bad_answers_count }.by(1)
      end
    end
  end
end
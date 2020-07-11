require 'rails_helper'

RSpec.describe Words::CheckAnswer do
  let!(:word) { create(:word, :with_translations)}
  
  describe '# call' do
    subject { described_class.new(word, answer).call }

    context 'when good answer is provided' do
      let(:answer) { word.translations.first.content}
    
      it { expect(subject).to be(true)}
    end

    context 'when bad answer is provided' do
      let(:answer) { 'Georgia'}
    
      it { expect(subject).to be(false)}
    end
  end
end
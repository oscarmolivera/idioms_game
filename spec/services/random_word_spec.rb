require 'rails_helper'

RSpec.describe Words::RandomWord do
  describe '#call' do 
    subject { described_class.new.call }
    let!(:word) { create(:word) }
    it 'generate a random word from database' do
      expect(subject).to eq(word)
    end
  end

end

require 'rails_helper'

RSpec.describe WordPolicy, type: :policy do
  subject { described_class }

  permissions :edit?, :update?, :destroy? do
    context 'when word does not belongs to user' do
      let(:word) { build_stubbed(:word) }
      let(:user) { build_stubbed(:user) }
      it "denies access to it" do
        expect(subject).not_to permit(user, word)
      end
    end
    context 'when word belongs to user' do 
      let(:word) { build_stubbed(:word, user: user) }
      let(:user) { build_stubbed(:user) }
      it "grants access to it" do
        expect(subject).to permit(user, word)
      end
    end
    
  end
end
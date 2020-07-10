require 'rails_helper'

RSpec.describe GamePolicy, type: :policy do
  subject { described_class }

  permissions :show? do
    context 'when game does not belongs to user' do
      let(:game) { build_stubbed(:game) }
      let(:user) { build_stubbed(:user) }
      it "denies access to it" do
        expect(subject).not_to permit(user, game) 
      end
    end
    context 'when game belongs to user' do 
      let(:game) { build_stubbed(:game, user: user) }
      let(:user) { build_stubbed(:user) }
      it "grants access to it" do
        expect(subject).to permit(user, game)
      end
    end
    
  end
end
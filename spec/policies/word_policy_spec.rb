require 'rails_helper'

RSpec.describe WordPolicy, type: :policy do
  subject { described_class }
  let(:user) { create(:user) }

  permissions :edit? do
    it "grants access if Word belongs to a user" do
      expect(subject).to permit(user, Word.new(user: user) )
    end
  end
end
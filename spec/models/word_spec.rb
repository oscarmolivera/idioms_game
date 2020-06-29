require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'initial columns' do
    it { is_expected.to have_db_column(:content) }
    it { is_expected.to have_db_column(:language_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:language) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:language) }
  end
end

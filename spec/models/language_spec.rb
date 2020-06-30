require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'initial columns' do
    it { is_expected.to have_db_column(:name) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_inclusion_of(:name).in_array(languages) } Validacion basada en arreglo.
  end

  describe 'associations' do
    it { is_expected.to have_many(:words) }
  end
end

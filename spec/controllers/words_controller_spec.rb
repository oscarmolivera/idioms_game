require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe ' GET index' do
    before { get :index }

    context 'when @words is present' do
      let(:word) { create(:word) }
      it 'assigns @words' do
        expect(assigns(:words)).to eq([word])
      end
    end

    context 'when no require validations' do
      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end

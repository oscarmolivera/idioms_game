require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe ' GET index' do
    subject { get :index }
    context 'when @words is present' do
      it 'assigns @words' do
        word = Word.create
        subject
        expect(assigns(:words)).to eq([word])
      end
    end
    context 'when no require validations' do
      it 'renders the index template' do
        subject
        expect(response).to render_template(:index)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET Index' do
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

  describe 'GET New' do
    before { get :new }

    it 'assigns @word' do
      expect(assigns(:word)).to be_a_new(Word)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST Create' do
    context 'when valid params' do
      let(:params) { { word: { value: 'Home', language: 'english' } } }
      subject { post :create, params: params }

      it 'create a new word' do
        expect { subject }.to change { Word.count }.by(1)
      end
    end

    context 'when invalid params' do
      let(:params) { { word: { value: '', language: :nil } } }
      subject { post :create, params: params }

      it 'does not create a new word' do
        expect { subject }.not_to (change { Word.count })
      end
    end
  end
end

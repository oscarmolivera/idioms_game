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
      let(:language) { create(:language) }
      let(:params) { { word: { content: 'Home', language_id: language.id } } }
      subject { post :create, params: params }

      it 'create a new word' do
        expect { subject }.to change { Word.count }.by(1)
      end
    end

    context 'when invalid params' do
      let(:params) { { word: { content: '', language_id: :nil } } }
      subject { post :create, params: params }

      it 'does not create a new word' do
        expect { subject }.not_to (change { Word.count })
      end
    end
  end

  describe 'GET Show' do
    let(:word) { create(:word) }
    let(:params) do
      {id: word.id}
    end    
    before { get :show, params: params }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET Edit' do
    before { get :edit, params: params }
    let(:word) { create(:word) }
    let(:params) { { id: word.id} }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT Update' do
    let(:word) { create(:word, language_id: language1.id) }
    let(:language1) { create(:language) }
    let(:language2) { create(:language) }

    context 'when params are correct' do
      let(:params) { { id: word.id, word: { content: 'House', language_id: language2.id } } }
      subject {put :update, params: params}
      
      it 'update word' do
        expect { subject }
          .to change { word.reload.content }
          .from(word.content)
          .to('House')
          .and change {word.reload.language_id}
          .from(language1.id)
          .to(language2.id)
      end

      it 'update language' do
        expect { subject }
          .to change { word.reload.language_id }
          .from(word.language_id)
          .to(language2.id)
      end
    end
    
    context 'when params are incorrect' do
      let(:params) { { id: word.id, word: { content: '', language_id: nil } } }

      it 'will not update the content' do
        expect { subject }.not_to change { word.reload.content }
      end

      it 'will not update the language' do
        expect { subject }.not_to change { word.reload.language_id }
      end
    end
  end
end

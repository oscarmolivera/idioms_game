require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe 'Post #create' do
    subject { post :create, xhr: true, params: params }
    let(:user) { create(:user) }
    let(:game) { create(:game, user: user) }
    let(:word) { create(:word, :with_translations) }
    let(:answer) { word.translations.first.to_s }
    let(:params) do
      {
        answer:{
          content: answer,
          game_id: game.id, 
          word_id: word.id
        }
      }
    end

    context 'where user is sign in' do
      before do
        sign_in(user)
      end

      it 'call service to check answer' do
        expect(Words::CheckAnswer).to receive(:new).with(word, answer, game).and_call_original
        subject 
      end

      it 'redirect to show page' do
        subject
        expect(response.status).to eq(200)
      end
    end

    context 'where user is not sign in' do
        before { subject }

        it 'return an Unauthorized Action' do
          expect(response).to have_http_status(401)
        end 
    end

  end
end

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe 'Post #create' do
    subject { post :create, params: params }
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

      it 'call service to chacj answer' do
        expect(Words::CheckAnswer).to receive(:new).with(word, answer, game).and_call_original
        subject 
      end

      it 'redirect to show page' do
        subject
        expect(response.status).to eq(302)
        expect(response).to redirect_to(game_path(game)) 
      end
    end

    context 'where user is not sign in' do
        before { post :create, params: params }

        it 'redirect to login page' do
          expect(subject).to redirect_to("/users/sign_in")
        end

        it 'the page show is :found but redirected' do
          expect(response).to have_http_status(302)
        end 
    end

  end
end

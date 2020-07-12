require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe 'Post #create' do
    let(:user) { create(:user) }
    let(:game) { create(:game) }
    let(:word) { create(:word, :with_translations, user: user) }
    let(:answer) { word.translations.first }
    let(:params) do
      {
        answer:{
          content: answer,
          game: game, 
          word: word
        }
      }
    end

    context 'where user is sign in' do
      before do
        sign_in(user)
        post :create, params: params
      end

      it 'renders the show template' do
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

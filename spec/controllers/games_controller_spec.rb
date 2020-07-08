require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe 'Post #create' do
    context 'when user is logged in' do
      let(:user) { create(:user) }
      let(:game) { create(:game) }
      subject { post :create, params:  { id:game.id }  }

      before do
        sign_in user
        subject
      end

      it 'redirect to show page (@game)' do
        expect(response).to redirect_to("/games/#{Game.last.id}")
      end

      it 'renders the show template' do
        expect(response).to render_template(:create)
      end

      it 'HttpResponse is OK' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is not logged in' do
      before { get :show, params: { id: 1 } }

      it 'redirect to login page' do
        expect(subject).to redirect_to("/users/sign_in")
      end

      it 'does not render the new template' do
        expect(response).not_to render_template(:show)
      end

      it do
        expect(response).to have_http_status(302)
      end      
    end
  end
end
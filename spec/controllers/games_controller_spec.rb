require 'rails_helper'

RSpec.describe GamesController, type: :controller do

  describe 'Post #create' do
    context 'when user is signed in' do
      let(:user) { create(:user) }
      let(:game) { create(:game) }
      subject { post :create, params:  { id:game.id }  }

      before do
        sign_in(user)
        subject
      end

      it 'redirect to show page (@game)' do #redirects to new game
         expect(response).to redirect_to("/games/#{Game.last.id}")
         expect(Game.last.user).to eq(user) # doble checking asosociation.
        #expect(subject).to redirect_to(user.games.last) --other way
      end
    end

    context 'when user is not signed in' do
      before { get :show, params: { id: 1 } }

      it 'redirect to login page' do
        expect(subject).to redirect_to("/users/sign_in")
      end

      it 'does not render the new template' do
        expect(response).not_to render_template(:show)
      end

      it 'the page show is :found' do
        expect(response).to have_http_status(302)
      end      
    end
  end

  describe 'Get #show' do
    context 'when user is signed in,' do
      let(:user) { create(:user) }
      let(:game) { create(:game, user: user) }
      subject { get :show, params: { id: game.id } }
      before do
        sign_in(user)
        subject
      end

      it 'assigns @game' do
        expect(assigns(:game)).to eq(game)
      end

      it 'renders the show template' do
        expect(response.status).to eq(200)
        expect(response).to render_template(:show) 
        #expect(response.body).to match /Game/
        #expect(response.body).to be_success
      end
    end

    context 'when user is not signed in' do
      let(:game) { create(:game) }
      subject { get :show, params: {id: game.id}}

      before { subject }

      it 'does not assigns @game' do
        expect(assigns(:game)).not_to eq(game)
      end

      it 'redirect to login page' do
        expect(subject).to redirect_to("/users/sign_in")
      end

      it 'does not render the new template' do
        expect(response).not_to render_template(:show)
      end
    end
  end
end
require 'rails_helper'

describe 'Games routes' do
  it 'should route to words INDEX' do
    expect(get: games_path).to route_to('games#index')
  end

  it 'should route to games SHOW' do
    expect(get: game_path(id: '1')).to route_to('games#show', id: '1')
  end

  it 'should route to games CREATE' do
    expect(post: games_path).to route_to('games#create')
  end

  it 'should route to games EDIT' do
    expect(get: edit_game_path(id: '1')).to route_to('games#edit', id: '1')
  end

  it 'should route to games UPDATE' do
    expect(patch: game_path(id: '1')).to route_to('games#update', id: '1')
    expect(put: game_path(id: '1')).to route_to('games#update', id: '1')
  end

  it 'should route to games DELETE' do
    expect(delete: game_path(id: '1')).to route_to('games#destroy', id: '1')
  end
end
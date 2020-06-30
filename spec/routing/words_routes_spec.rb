require 'rails_helper'

describe 'Words routes' do
  it 'should route to words INDEX' do
    expect(get: words_path).to route_to('words#index')
  end

  it 'should route to words SHOW' do
    expect(get: word_path(id: '1')).to route_to('words#show', id: '1')
  end

  it 'should route to words CREATE' do
    expect(post: words_path).to route_to('words#create')
  end

  it 'should route to words EDIT' do
    expect(get: edit_word_path(id: '1')).to route_to('words#edit', id: '1')
  end

  it 'should route to words UPDATE' do
    expect(patch: word_path(id: '1')).to route_to('words#update', id: '1')
    expect(put: word_path(id: '1')).to route_to('words#update', id: '1')
  end

  it 'should route to words DELETE' do
    expect(delete: word_path(id: '1')).to route_to('words#destroy', id: '1')
  end
end
require 'rails_helper'

RSpec.describe 'Games routes', type: :routing do
  it 'should route to Answers#create' do
    expect(post: answers_path).to route_to('answers#create')
  end
end
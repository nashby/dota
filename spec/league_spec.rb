require 'spec_helper'

describe Dota::League do
  let(:league) { Dota::League.new(fixture(:league)) }

  it 'returns league id' do
    league.id.must_equal 65001
  end

  it 'returns name' do
    league.name.must_equal 'The International'
  end

  it 'returns description' do
    league.description.must_equal 'Watch the top 16 teams from around the world compete in The International.'
  end

  it 'returns tournament url' do
    league.url.must_equal 'http://www.dota2.com/'
  end
end

require 'spec_helper'

describe 'delegation' do
  it 'delegates #match to the client' do
    mock = MiniTest::Mock.new
    mock.expect(:match, :result, [123])

    Dota.stub(:client, mock) do
      Dota.match(123).must_equal :result
    end

    mock.verify
  end
end

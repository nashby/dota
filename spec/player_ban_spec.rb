require 'spec_helper'

describe Dota::PlayerBan do
  let(:player_ban) { Dota::PlayerBan.new(fixture(:player_ban)) }

  it "returns steam id" do
    player_ban.steam_id.must_equal 76561198070396703
  end

  it "returns community banned status" do
    player_ban.community_banned?.must_equal false
  end

  it "returns vac banned status" do
    player_ban.vac_banned?.must_equal false
  end

  it "returns economy banned status" do
    player_ban.economy_banned_status.must_equal 'none'
  end
end
require 'dota/version'
require 'dota/client'

module Dota
  extend SingleForwardable

  def_delegators :client, :configure, :match, :history, :leagues, :live_leagues

  def self.client
    @client ||= Client.new
  end
end

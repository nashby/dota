# Dota

[![TravisCI Build Status](https://secure.travis-ci.org/nashby/dota.png?branch=master)](http://travis-ci.org/nashby/dota)

Ruby wrapper for Dota 2 WebAPI

## Usage

```ruby
Dota.configure do |config|
  config.api_key = 'STEAM-WEB-API-KEY'
end
```

You can get your api key [here](http://steamcommunity.com/dev/apikey)

#### Match details ([GetMatchDetails](http://wiki.teamfortress.com/wiki/WebAPI/GetMatchDetails) API call)

```ruby
Dota.match(22345678)
```

#### League listing ([GetLeagueListing](http://wiki.teamfortress.com/wiki/WebAPI/GetLeagueListing) API call)

```ruby
Dota.leagues
```

#### Live league games ([GetLiveLeagueGames](http://wiki.teamfortress.com/wiki/WebAPI/GetLiveLeagueGames) API call)

```ruby
Dota.live_leagues
```

#### Match history ([GetMatchHistory](http://wiki.teamfortress.com/wiki/WebAPI/GetMatchHistory) API call)

```ruby
Dota.history
```

#### View profiles ([GetPlayerSummaries](http://wiki.teamfortress.com/wiki/WebAPI/GetPlayerSummaries) API call)

```ruby
Dota.profiles(76561197993409962)
```

#### View player bans ([GetPlayerBans](http://wiki.teamfortress.com/wiki/WebAPI/GetPlayerBans) API call)

```ruby
Dota.bans(76561197993409962)
```

#### View friends ([GetFriendList](http://wiki.teamfortress.com/wiki/WebAPI/GetFriendList) API call)

```ruby
Dota.friends(76561197993409962)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

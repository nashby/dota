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

### Match details (GetMatchDetails API call)

```ruby
Dota.match(22345678)
```

### League listing (GetLeagueListing API call)

```ruby
Dota.leagues
```

### Live league games (GetLiveLeagueGames API call)

```ruby
Dota.live_leagues
```

### Match history (GetMatchHistory API call)

```ruby
Dota.history
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

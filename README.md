# README

## Requirements

- Ruby 2.6.2
- Docker Compose (to run locally)

## Setup

```
bin/setup
```

Then, in Rails console:

```rb
require './db/transitions/load_cards_from_json.rb'
LoadCardsFromJson.run
```

## Credentials

Need to set up the following:

- `config/credentials/test.key`
- `config/credentials/development.key`
- `config/master.key`

## Testing locally

Be sure to enable caching for OAuth to work:

```
rails dev:cache
```

There are a bunch of rake tasks to simulate actions from other users.

To see them, run `rake --tasks`, and look for `rake game:....`.

For most games, these are the three common tasks:

```
rake game:new_player # add new player to the game
rake game:play_cards # all players other than local account and judge submit cards
rake game:judge_winner # judge randomly picks a winner
rake game:new_round # Start a new round
```

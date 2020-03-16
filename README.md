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

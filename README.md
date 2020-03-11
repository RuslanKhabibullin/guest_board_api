[![Build Status](https://semaphoreci.com/api/v1/khabibullin_ruslan/guest_board_api/branches/master/badge.svg)](https://semaphoreci.com/khabibullin_ruslan/guest_board_api)
[![Maintainability](https://api.codeclimate.com/v1/badges/132ebef0e33577fb9a01/maintainability)](https://codeclimate.com/github/RuslanKhabibullin/guest_board_api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/132ebef0e33577fb9a01/test_coverage)](https://codeclimate.com/github/RuslanKhabibullin/guest_board_api/test_coverage)

# Guest Board

Simple API for chat with one common room. Stack:
- `Ruby` language
- `Hanami` framework
- `JWT` authentication strategy
- `CORS` protection
- `Google Oauth` strategies
- Websockets implemented by `Pusher` service

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](https://guides.hanamirb.org/), [API docs](http://docs.hanamirb.org/1.3.3/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸

# lita-github-review

[![Build Status](https://travis-ci.org/mapreal19/lita-github-review.png?branch=master)](https://travis-ci.org/mapreal19/lita-github-review)
[![Coverage Status](https://coveralls.io/repos/github/mapreal19/lita-github-review/badge.svg?branch=master)](https://coveralls.io/github/mapreal19/lita-github-review?branch=master)

Assign 2 random reviewers to your Pull Requests. Plays well with Reviewable

## Installation

Add lita-github-review to your Lita instance's Gemfile:

``` ruby
gem "lita-github-review"
```

## Configuration

- Place the following in your Lita config file:

```
config.handlers.github_review.reviewers = %w(github_username1 github_username2...) # Array with the reviewers
config.handlers.github_review.github_token = <github_token> # Github token for your bot
```

- On your repo, point the webhook for Pull Requests to the url: `<your_bot_url>/pull_requests/new`

## Usage

Your bot will pick two random reviewers when opening a new Pull Request

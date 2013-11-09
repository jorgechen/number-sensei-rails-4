#!/bin/bash

# Reference:
# http://railscasts.com/episodes/366-sidekiq?view=asciicast

# Start the Redis server.
redis-server /usr/local/etc/redis.conf

# Start the Sidekiq process.
bundle exec sidekiq -L log/sidekiq.log -C config/sidekiq.yml -d

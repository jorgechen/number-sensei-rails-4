#!/bin/bash

# Reference:
# http://railscasts.com/episodes/366-sidekiq?view=asciicast
# http://redis.io/topics/quickstart

echo '# Start the Redis server, if it is not yet running.'
redis-server /usr/local/etc/redis.conf


echo '# Stop the Sidekiq background processing.' # Last arg is seconds to timeout.
bundle exec sidekiqctl stop tmp/pids/sidekiq.pid 30

echo '# Starting Sidekiq process.'
bundle exec sidekiq --concurrency 1 -L log/sidekiq.log -C config/sidekiq.yml -d -e production



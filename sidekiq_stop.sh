#!/bin/bash

echo '# Stop the Sidekiq background processing.'
bundle exec sidekiqctl stop tmp/pids/sidekiq.pid 30 # Last arg is seconds to timeout.

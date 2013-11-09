#!/bin/bash

# Stop the Sidekiq background processing. Last arg is seconds to timeout.
bundle exec sidekiqctl stop tmp/pids/sidekiq.pid 30

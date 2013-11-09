#!/bin/bash

# Start the PostgreSQL server on Mac
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# Reference:
# http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast
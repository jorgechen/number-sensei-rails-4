#!/bin/bash

RAILS_ENV=development rake db:drop db:create db:schema:load db:seed

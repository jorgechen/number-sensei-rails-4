#!/bin/bash

RAILS_ENV=production rake db:drop db:create db:schema:load db:seed

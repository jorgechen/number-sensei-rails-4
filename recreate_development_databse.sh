#!/bin/bash

RAILS_ENV=development rake db:drop db:create db:migrate db:seed
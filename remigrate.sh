#!/bin/bash

# regenerates schema.rb
rake db:drop db:create db:migrate

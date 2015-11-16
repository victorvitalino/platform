#!/bin/bash

kill $(cat < tmp/pids/unicorn.pid)
RAILS_ENV=production unicorn_rails -c config/unicorn.rb -D
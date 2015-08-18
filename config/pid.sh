#!/bin/bash

git pull origin master

echo "compílando css..."
rake assets:precompile


PROCESSO=$(cat < tmp/pids/unicorn.pid)

echo "matando processo e restartando servidor..."
kill $PROCESSO
RAILS_ENV=production unicorn_rails -c unicorn.rb -D
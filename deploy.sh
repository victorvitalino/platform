#!/bin/bash

git add -A
git commit -m 'deploy --deploy.sh'
git push origin master
git checkout stable
git merge master
git push origin stable
git checkout master
mina deploy force_assets=1

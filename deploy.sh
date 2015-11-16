#!/bin/bash

date_deploy=`date +"%Y%m%d%H%M-deploy"`
user_deploy=`git config user.email`

git pull origin master
git add -A
git commit -m "$date_deploy --deployer $user_deploy"
git push origin master
git checkout stable
git merge master
git push origin stable
git checkout master
mina deploy force_assets=1

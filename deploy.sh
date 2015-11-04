#!/bin/bash

$date = date +"%Y%m%d%H%M-deploy"
$user_deploy = git config user.name

git add -A
git commit -m '$date --deployer $user_deploy'
git push origin master
git checkout stable
git merge master
git push origin stable
git checkout master
mina deploy force_assets=1

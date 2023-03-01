#!/bin/bash
# date time
currentDateTime=`date '+%Y-%m-%d %H:%M:%S'`
commitMsg=$currentDateTime" "$1

echo "提交commit: "${commitMsg}

git add .
git commit -m "${commitMsg}"
git pull
git status

echo "git add/commit/pull done..."
# push to remote main branch
git push -u origin main
#!/bin/bash
# date time
currentDateTime=$(date +%Y-%m-%d %H:%m:%s)
commitMsg=$1

echo "提交commit: "${commitMsg}

git add .
git commit -m "${commitMsg}"
git pull
git status

echo "git add/commit/pull done..."

git push -u origin main
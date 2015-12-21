#!/bin/bash

hugo

git checkout master

cp -R public/* .
rm -rf public

git add .
git commit -m "publishing"
git push

#!/bin/bash

hugo

git co master

cp -R public/* .

git add .
git commit -m "publishing"
git push

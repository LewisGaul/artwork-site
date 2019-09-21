#!/usr/bin/env bash

bundler exec jekyll build
cd _gh-pages/
git pull
rm -r artwork/ albums/ assets/
cp -r ../_static/* .
git add artwork/ albums/ assets/
git commit -am "Deploy"
git push

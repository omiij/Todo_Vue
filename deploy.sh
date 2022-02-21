#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -add
git commit -m 'New Deployment'
git push -f https://github.com/omiij/Todo_Vue.git master:gh-pages

cd -
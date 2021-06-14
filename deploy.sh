#!/bin/bash
set -e

echo "* checking out the master branch:"
git clone --single-branch --branch main git@github.com:monmonzaw/quickstart.git main

echo "* synchronizing the files:"
rsync -arv public/ main --delete --exclude ".git"
cp README.md main/

echo "* pushing to master:"
cd main
git config user.name "monmonzaw"
git config user.email ${GIT_EMAIL}
git add -A
git commit -m "Automated deployment job" --allow-empty
git push origin main

echo "* done"

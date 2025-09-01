#!/bin/bash
set -e

# Paths
PUBLIC_DIR="./public"
DEPLOY_REPO="git@github.com:techbytes-td/techbytes-podcast-site.git"

# Temp clone
rm -rf /tmp/podcast-deploy
git clone $DEPLOY_REPO /tmp/podcast-deploy

# Copy new files, but never touch the .git directory
rsync -av --delete --exclude '.git' $PUBLIC_DIR/ /tmp/podcast-deploy/

# Commit & push
cd /tmp/podcast-deploy
git add .
git commit -m "Update podcast site & feed" || echo "No changes to commit"
git push origin main

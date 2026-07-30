#!/bin/zsh

# Determine commit message: use argument if provided, otherwise default
if [ -n "$1" ]; then
  MSG="$1"
else
  MSG="$(date)"
fi

# 1. Commit and push your source code (main branch)
echo "--- Pushing source code to main ---"
git add .
git commit -m "Update source: $MSG"
git push origin main

# 2. Build the site
echo "--- Building site with Hugo ---"
hugo

# 3. Enter the public directory to push the generated site
echo "--- Pushing site to gh-pages ---"
cd public
git add -A
git commit -m "Deploy site: $MSG"
git push origin gh-pages

# 4. Return to root
cd ..
echo "--- Deployment complete ---"

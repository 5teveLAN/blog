# Determine commit message: use argument if provided, otherwise default
if [ -n "$1" ]; then
  MSG="$1"
else
  MSG="Update blog"
fi

# 1. Commit and push your source code (main branch)
echo "--- Pushing source code to main ---"
git add .
git commit -m "$MSG"
git push origin main

# 2. Build the site
echo "--- Building site with Hugo ---"
hugo

# 3. Handle public/ as a separate repo pointing to gh-pages
echo "--- Preparing public/ repo ---"
cd public

# Re-initialize public repo if .git was removed
# (e.g. by rm -rf public or hugo --cleanDestinationDir)
if [ ! -d ".git" ]; then
  echo ">> public/.git missing, reinitializing separate repo..."
  git init
  git remote add origin git@github.com:5teveLAN/blog.git
fi

# Ensure we are on the gh-pages branch
git checkout gh-pages 2>/dev/null || git checkout -b gh-pages

# 4. Push the generated site to gh-pages
echo "--- Pushing site to gh-pages ---"
git add -A
git commit -m "$MSG" 2>/dev/null || echo "(nothing new to commit)"
git push origin gh-pages --force

# 5. Return to root
cd ..
echo "--- Deployment complete ---"

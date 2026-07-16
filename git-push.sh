#!/bin/zsh
set -e  # 遇到錯誤就停止

# 1️⃣ 先處理 main 分支（Hugo 原始碼）
echo "🌳 切換到 main 分支..."
git checkout main

echo "📦 檢查 main 是否有未 commit 的變更..."
if [[ -z $(git status --porcelain) ]]; then
  echo "✅ 沒有需要 commit 的變更"
else
  echo "📦 正在 commit 所有變更（main）..."
  git add .
  git commit -m "."
fi

echo "🚀 正在 push main 到遠端..."
git push origin main

# 2️⃣ 用 Hugo 產生靜態檔案（寫入 public/，此時上層在 main）
echo ""
echo "🔨 正在執行 hugo 產生靜態檔案..."
hugo

# 3️⃣ 進到 public/ 把 hugo 產生的檔案 commit 到 gh-pages
echo ""
echo "🌳 切換到 gh-pages 分支..."
cd public
git checkout gh-pages

# 把 main 分支的檔案內容複製過來
echo "📋 將 hugo 新產生的檔案複製到 gh-pages..."
git checkout main -- .

git add .
if [[ -z $(git status --porcelain) ]]; then
  echo "✅ 沒有需要 commit 的變更"
else
  git commit -m "."
fi

echo "🚀 正在 push gh-pages 到遠端..."
git push origin gh-pages

# 4️⃣ 切回 main
git checkout main
cd ..

echo ""
echo "✨ 完成！"
echo "   - main 分支已更新（Hugo 原始碼）"
echo "   - gh-pages 分支已更新（靜態網站）"
echo "   查看 GitHub Pages: https://5tevelan.github.io/blog/"



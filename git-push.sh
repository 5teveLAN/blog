#!/bin/zsh

# 檢查是否有未 commit 的變更
if [[ -z $(git status --porcelain) ]]; then
  echo "✅ 沒有需要 commit 的變更"
else
  echo "📦 正在 commit 所有變更..."
  git add .
  git commit -m "."
fi

echo "🚀 正在 push 到遠端..."
git push

echo ""
echo "✨ 完成！GitHub Actions 會自動 build 並 deploy 網站。"
echo "   查看進度: https://github.com/5teveLAN/blog/actions"

#!/usr/bin/env bash
rsync -a --delete ~/.config/ ~/archie/config/
cd ~/archie || exit 1
if [[ -n $(git status --porcelain) ]]; then
  git add .
  git commit -m "Auto-sync on $(date +'%Y-%m-%d %H:%M')"
  git push
  echo "✅ Dotfiles synced and pushed to GitHub."
else
  echo "✔️ No changes to push."
fi


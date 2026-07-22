#!/bin/zsh
set -e

SRC="$HOME/golf-group.html"
REPO="$HOME/github/ggc-golf-repo"

cp "$SRC" "$REPO/index.html"
cd "$REPO"

if git diff --quiet index.html; then
    echo "변경사항 없음"
    exit 0
fi

git add index.html
git commit -m "업데이트: $(date '+%Y-%m-%d %H:%M')"
git -c credential.helper='!gh auth git-credential' push

echo "✅ 배포 완료 → https://tysonkwon.github.io/ggc-golf/"

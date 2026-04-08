#!/bin/bash
set -euo pipefail
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"
TOOLKIT_DIR="$REPO_DIR/plugins/workflow-toolkit/skills"

mkdir -p "$SKILLS_DIR"

WRITING_DIR="$REPO_DIR/plugins/writing-polish/skills"

# Link workflow-toolkit skills (originals + pinyin aliases)
for skill in commit sync-docs ddd review-plan fix-ci save-plan capture-lesson verify-done wrap-up \
             tijiao tongbu shenpi xiufu baocun fupan yanzheng shouwei; do
  target="$TOOLKIT_DIR/$skill"
  link="$SKILLS_DIR/$skill"
  if [ -L "$link" ]; then
    rm "$link"
  fi
  ln -sf "$target" "$link"
  echo "✓ $skill → $target"
done

# Link writing-polish pinyin alias
for skill in runse; do
  target="$WRITING_DIR/$skill"
  link="$SKILLS_DIR/$skill"
  if [ -L "$link" ]; then
    rm "$link"
  fi
  ln -sf "$target" "$link"
  echo "✓ $skill → $target"
done

echo ""
echo "Done. 19 skills linked to ~/.claude/skills/ (10 originals + 9 pinyin aliases)"
echo "Run /skills in Claude Code to verify."

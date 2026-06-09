#!/usr/bin/env bash
# bot-build · Claude Code 스킬 자동 설치 스크립트
# 사용법: curl -fsSL https://raw.githubusercontent.com/steveaimkt/bot-build/main/install.sh | bash

set -e

REPO_URL="https://github.com/steveaimkt/bot-build.git"
CLONE_DIR="${BOT_BUILD_DIR:-$HOME/dev/bot-build}"
SKILL_DIR="$HOME/.claude/skills/bot-build"

echo "🤖 bot-build 스킬 자동 설치를 시작합니다."
echo ""

# 1. 사전 점검
echo "▶ 1/4  사전 점검"

if ! command -v git &>/dev/null; then
  echo "❌ git 이 설치되어 있지 않습니다."
  echo "   macOS  : xcode-select --install"
  echo "   Windows: https://git-scm.com/download/win"
  exit 1
fi
echo "   ✅ git $(git --version | awk '{print $3}')"

if ! command -v claude &>/dev/null; then
  echo "⚠️  Claude Code CLI 미감지 (계속 진행하지만 사용 전 설치 필요)"
  echo "    npm i -g @anthropic-ai/claude-code"
else
  echo "   ✅ Claude Code $(claude --version 2>&1 | head -1)"
fi

# 2. 클론
echo ""
echo "▶ 2/4  저장소 클론 → $CLONE_DIR"

mkdir -p "$(dirname "$CLONE_DIR")"

if [ -d "$CLONE_DIR/.git" ]; then
  echo "   ⚠️  이미 존재 → 최신본 pull"
  (cd "$CLONE_DIR" && git pull --ff-only)
else
  git clone --depth 1 "$REPO_URL" "$CLONE_DIR"
fi
echo "   ✅ 완료"

# 3. symlink 생성
echo ""
echo "▶ 3/4  ~/.claude/skills/bot-build symlink 생성"

mkdir -p "$HOME/.claude/skills"

if [ -e "$SKILL_DIR" ] && [ ! -L "$SKILL_DIR" ]; then
  BAK="$SKILL_DIR.bak.$(date +%Y%m%d-%H%M%S)"
  mv "$SKILL_DIR" "$BAK"
  echo "   ⚠️  기존 폴더 백업 → $BAK"
fi

ln -sfn "$CLONE_DIR/skills/bot-build" "$SKILL_DIR"
echo "   ✅ symlink: $SKILL_DIR → $CLONE_DIR/skills/bot-build"

# 4. 검증
echo ""
echo "▶ 4/4  검증"

if [ -f "$SKILL_DIR/SKILL.md" ]; then
  LINES=$(wc -l < "$SKILL_DIR/SKILL.md" | tr -d ' ')
  echo "   ✅ SKILL.md 도달 ($LINES 줄)"
else
  echo "   ❌ SKILL.md 도달 실패 — 수동 확인 필요"
  exit 1
fi

echo ""
echo "🎉 설치 완료!"
echo ""
echo "다음 액션:"
echo "  1. Claude Code 종료 후 새로 시작 (스킬 인덱싱 갱신)"
echo "  2. 다음 발화 입력:"
echo ""
echo "     나만의 봇 구축을 시작하자"
echo ""
echo "  → 5 PHASE 자동 진행 (5~15분):"
echo "     PHASE 1 · 봇 기획 (인벤토리 자동 스캔)"
echo "     PHASE 2 · 봇 제안 (프리셋 8 + 자유 설계 Z)"
echo "     PHASE 3 · MCP & 기능 안내"
echo "     PHASE 4 · 봇 설치 (settings.json · launchd · cron)"
echo "     PHASE 5 · 디스코드 채널 연동 + 첫 가동 검증"
echo ""
echo "  ⭐ 추천 시작: 프리셋 A (일정·메일 매니저) — 가장 기본 · 5분 완료"
echo "  ⭐ 공통 기본: 매일 아침 07:00 알림 (모든 프리셋 기본 탑재)"

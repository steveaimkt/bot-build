# bot-build

> Discord Channels 연결된 봇을 **"내 업무 비서"** 로 발전시키는 Claude Code 스킬.
> 마케팅-OS 강의 (Part 2 / 4-2) 수강생용 봇 고도화 자동 설계 도구.

## 한 줄 요약

> **"나만의 봇 구축을 시작하자"** 발화 → 5분 안에 봇 비서 완성
> 8개 프리셋 (기본 3 + 고도화 5) + 자유 설계 (Z) + 자동 산출물 5종 박제

## 설치

### 빠른 설치 (한 줄 명령)

```bash
curl -fsSL https://raw.githubusercontent.com/steveaimkt/bot-build/main/install.sh | bash
```

### 수동 설치 (clone + symlink)

```bash
# 1. 원하는 폴더로 이동
cd ~/dev   # 또는 ~/Desktop · ~/Documents

# 2. clone
git clone https://github.com/steveaimkt/bot-build.git
cd bot-build

# 3. symlink
mkdir -p ~/.claude/skills
ln -sfn "$(pwd)/skills/bot-build" ~/.claude/skills/bot-build

# 4. Claude Code 재시작
```

## 사용

Claude Code 안에서 :

```
나만의 봇 구축을 시작하자
```

→ 5 PHASE 자동 진행 :

```
📋 PHASE 1 · 봇 기획 (인벤토리 자동 스캔)
💡 PHASE 2 · 봇 제안 (프리셋 8 + 자유 설계 Z)
🔌 PHASE 3 · MCP & 기능 안내
⚙️ PHASE 4 · 봇 설치 (settings.json · launchd · cron 자동)
📡 PHASE 5 · 디스코드 채널 연동 + 첫 가동 검증
```

## 프리셋 8 + 자유 설계 Z

### 기본 3개 · 모든 사용자
- **A. 📅 일정·메일 매니저** (가장 기본 · 추천 ⭐)
- **B. 📊 마케팅 매니저** (광고·매출 운용)
- **C. ✍️ 콘텐츠 매니저** (트렌드·뉴스레터·SNS)

### 고도화 5개 · marketing-os Part 3~8 자산 활용
- **D. 🔬 리서치 인텔리전스** (Part 4)
- **E. 📝 콘텐츠 파이프라인** (Part 3+5)
- **F. 💰 광고 옵스** (Part 6)
- **G. 📊 GA4 데이터 분석** (Part 7)
- **H. 🎯 CRM 리텐션** (Part 8)

### 자유 설계
- **Z. 🎨 직접 답변** (Q1~Q4 인터뷰 · 15분)

## 공통 기본 기능

⭐ **매일 아침 07:00 알림** — 모든 프리셋 기본 탑재

## 산출물 (자동 박제)

| 파일 | 위치 | 용도 |
|---|---|---|
| `my-bot-spec.md` | `outputs/{date}/bot-design/` | 페르소나·에이전트·정책·라우팅 |
| `OPERATIONS.md` | `~/.claude/channels/discord/` | 발화 매뉴얼 15~20개 + 응급 명령 |
| `AI-비서-아키텍처.md` | `marketing-os/agents/` | 시스템 7 도메인 팀 매트릭스 (옵션) |
| `settings.json` 패치 | `marketing-os/.claude/` | 권한 정책 (자동/승인/금지) |
| `launchd plist` | `~/Library/LaunchAgents/` | 매일·매주 자동화 (macOS) |

## 선행 조건

1. **Claude Code v2.1.80+** + **claude.ai 로그인**
2. **Discord Channels 셋업 완료** ([discord-channels-setup](https://github.com/steveaimkt/discord-channels-setup-plugin))
3. **marketing-os 강의 폴더** (활성 MCP 수만큼 가능한 프리셋 범위 결정)

## 학습 흐름 (마케팅-OS 강의 수강생)

```
Part 1   · 환경 설정 (Claude Code · claude.ai)
Part 2   · MCP 12개 설치 (최소 Gmail + Calendar 부터)
   └ 2-12 Discord Channels 셋업 → "디스코드 채널 설치"
Part 3~9 · 콘텐츠·리서치·광고·데이터·CRM 에이전트 학습
   ↓
이 스킬 (bot-build) · 봇 비서 고도화
   "나만의 봇 구축을 시작하자"
   → 진도 따라 프리셋 A → B → F → G → H 순차 활성
Part 10  · AX 협업 (오케스트레이터 + cron 자동화)
```

## 라이선스

MIT

## 관련

- 강의: 패스트캠퍼스 「24시간 Full 가동 마케팅 자동화! 30개 에이전트로 완성하는 클로드코드」
- 선행 셋업: [discord-channels-setup-plugin](https://github.com/steveaimkt/discord-channels-setup-plugin)

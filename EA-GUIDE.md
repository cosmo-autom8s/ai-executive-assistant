# My Executive Assistant — Guide

## TLDR — Your Commands

| Command | What it does |
|---------|-------------|
| `/ea` | Talk to your EA. Just speak naturally — they'll handle the rest. |
| `/ea-help` | See all commands and what they do. |
| `/ea-setup` | Set up your EA — personality, tools, and preferences. |
| `/ea-morning-brief` | Daily startup — calendar + tasks + email → energy-optimized plan. |
| `/ea-checkin` | Afternoon review — update statuses, plan tomorrow, track velocity. |
| `/ea-weekly-plan` | Monday ritual — map the week with sprint goal, day slots, capacity. |
| `/ea-weekly-retro` | Friday look-back — planned vs. actual, patterns, velocity trends. |
| `/ea-monthly-goals` | Monthly reset — set 3 focus areas, park distractions. |
| `/ea-add-task` | Quick capture — auto-sizes, auto-categorizes, checks capacity. |
| `/ea-delegate` | Hand off a task — logs delegation, sets follow-up reminder. |
| `/ea-meeting-prep` | Pre-meeting brief — context, open items, questions to ask. |
| `/ea-plan-schedule` | Brain dump → organized plan — drop a list and it gets integrated. |
| `/ea-night-cleanup` | End-of-day cleanup — sizes tasks, flags overdue, drafts tomorrow. |

---

## What Is This?

Your EA is an AI-powered executive assistant built as Claude Code slash commands. It manages your daily workflow through whatever tools you connect — task manager, calendar, knowledge base, email — plus local context files that persist between conversations.

Type `/ea` to start talking. If you know exactly what you need, use a specific command.

---

## Getting Started

1. **Install:** Run `./install.sh` from the repo
2. **Personalize:** Run `/ea-setup` — it asks about your working style and connects your tools
3. **Go:** Run `/ea-morning-brief` to start your first day

The EA works out of the box with default settings. Personalizing it makes everything better.

---

## How It Works

### The Daily Rhythm
1. **Morning:** `/ea-morning-brief` pulls your calendar, tasks, and context → presents an energy-optimized plan with Top 3 priorities and Quick Wins
2. **During the day:** `/ea-add-task`, `/ea-delegate`, `/ea-meeting-prep`, `/ea-plan-schedule` as needed
3. **Afternoon:** `/ea-checkin` reviews what got done, plans tomorrow
4. **End of day:** `/ea-night-cleanup` organizes the backlog and drafts tomorrow's plan

### The Weekly Cadence
- **Monday:** `/ea-weekly-plan` maps the week — outcomes, day slots, sprint goal
- **Friday:** `/ea-weekly-retro` reviews the week — patterns, velocity, recommendations

### The Monthly Direction
- **Start of month:** `/ea-monthly-goals` sets 3 focus areas and parks everything else

---

## Skills In Detail

### `/ea` — The Front Door
Start any conversation with `/ea` and your EA is there. Just talk naturally — it reads your context silently (today's plan, weekly goals, waiting-on items) and handles whatever you need. Routes to the right skill automatically, flags things proactively, and calls out patterns.

### `/ea-setup` — Personalization Wizard
Set up your EA in about 5 minutes. You can provide an existing document about yourself (personality profile, working style assessment, etc.) or answer a few questions. Then connect your tools. The wizard generates your profile at `~/.claude/ea-profile.md`.

### `/ea-morning-brief` — Daily Startup
Pulls your calendar, tasks, email, and knowledge base. Presents:
- **Top 3** — M/L tasks scored by impact x urgency
- **Quick Wins** — S tasks for admin time or between meetings
- **Energy plan** — tasks matched to your energy windows
- **Heads up** — overdue items, waiting-on follow-ups, capacity warnings
- **Calendar blocks** — after you approve the plan, offers to create `[EA]` focus blocks in your calendar for M/L tasks. Always asks first, never auto-creates.

80% buffer on capacity. Tasks matched to your energy windows from your profile.

### `/ea-checkin` — Afternoon Review
Reviews what got done vs. planned. Updates task statuses. Plans tomorrow. Tracks daily velocity. Catches tasks that are slipping. If you seem drained, asks what's causing it.

### `/ea-weekly-plan` — Monday Ritual
Maps the full week. Pulls calendar, all open tasks, and velocity data from last week. Helps set 3-5 weekly outcomes tied to monthly goals. Slots tasks into days based on priority, size, meetings, and context bundling. Sets a sprint goal. Flags meeting-heavy days and orphan tasks.

### `/ea-weekly-retro` — Friday Look-Back
Compares planned vs. actual. Calculates completion rate and overcommit score. Surfaces patterns. Checks monthly goal alignment. Updates velocity trends. Gives specific recommendations for next week.

### `/ea-monthly-goals` — Monthly Reset
Sets 3 focus areas with measurable success criteria. Checks alignment with your main goal. Forces you to name what you're NOT doing this month. If your profile mentions a deliberate decision-making style, the EA will suggest sleeping on new goals before locking in.

### `/ea-add-task` — Quick Capture
Say "I need to do X" and it's handled. Auto-sizes (S/M/L), auto-categorizes against monthly goals, proposes a date. Flags orphan tasks. Checks impact on today's plan. Supports batch mode.

### `/ea-delegate` — Hand It Off
Delegate a task to someone. Logs to delegation tracker, sets a follow-up reminder in waiting-on (1 day before due). Can draft a message to send them.

### `/ea-meeting-prep` — Show Up Loaded
Pre-meeting brief. Pulls interaction history, open tasks related to attendees, and waiting-on items. Outputs: WHO / WHY IT MATTERS / TOP QUESTION, then full brief with priorities, questions, and desired outcome.

### `/ea-plan-schedule` — Brain Dump → Plan
Drop a loose plan, meeting notes, or task list. It extracts tasks, sizes them, checks for conflicts, proposes integration, and creates everything after approval.

### `/ea-night-cleanup` — End-of-Day Autopilot
Runs autonomously. Sizes unsized tasks, categorizes against goals, flags overdue items, rebuilds task cache, drafts tomorrow's plan. Never changes task status or deletes — only organizes.

---

## Task Sizing

| Size | Time | Examples |
|------|------|----------|
| **S** | <30 min | Quick follow-ups, replies, approvals |
| **M** | 30min-2hr | Drafts, meeting prep, calls, research |
| **L** | 2hr+ | Deep work, presentations, strategy |

**Default daily capacity:** 1L + 2M + 2S (~5-6h actual work). 80% buffer rule always applied. Customize in your profile.

## Tool Categories

| Category | What it enables | Examples |
|----------|----------------|----------|
| Task Manager | Task tracking, auto-sizing, daily plans | Notion, Todoist, Linear, Asana |
| Calendar | Schedule-aware planning, meeting prep | Google Calendar, Outlook |
| Knowledge Base | Daily context, energy awareness | Obsidian, Apple Notes |
| Email | Morning inbox scan, urgent flagging | Gmail, Outlook |

All optional. The EA works without any tools — it just gets better with them.

## Where Things Live

| What | Where |
|------|-------|
| EA commands | `~/.claude/commands/ea-*.md` |
| Your profile | `~/.claude/ea-profile.md` |
| Context files (EA memory) | `~/.claude/ea-context/` |
| Example profiles | `config/` in the repo |

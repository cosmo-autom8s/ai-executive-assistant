---
name: ea-help
description: See all EA commands and what they do
---

# EA Commands

Display this command reference to the user:

---

## Setup
| Command | What it does |
|---------|-------------|
| `/ea-setup` | Set up your EA — personality, tools, and preferences |

## Daily Use
| Command | What it does |
|---------|-------------|
| `/ea` | Talk to your EA — ask questions, think out loud, get advice |
| `/ea-help` | Show this command reference |

## Rituals
| Command | When | What it does |
|---------|------|-------------|
| `/ea-morning-brief` | Morning | Pull calendar, tasks, and email into today's plan |
| `/ea-checkin` | Afternoon | Review progress, adjust plan, flag blockers |
| `/ea-night-cleanup` | Evening | Autonomous cleanup — size tasks, rebuild cache, draft tomorrow |
| `/ea-weekly-plan` | Monday | Plan the week — goals, capacity, day-by-day slots |
| `/ea-weekly-retro` | Friday | Review the week — completion rate, patterns, wins and misses |
| `/ea-monthly-goals` | Monthly | Set 3 focus areas with success criteria |

## Actions
| Command | What it does |
|---------|-------------|
| `/ea-add-task` | Quick-capture a task (auto-sized, auto-categorized) |
| `/ea-delegate` | Hand off a task and track the follow-up |
| `/ea-meeting-prep` | Get a brief before a meeting — context, open items, questions |
| `/ea-plan-schedule` | Turn a brain dump into an organized, time-blocked schedule |

---

## Tips

- **All tools are optional** — the EA works without any connected tools, using local context files and conversation.
- Run `/ea-setup` to personalize your EA and connect tools.
- Your profile lives at `~/.claude/ea-profile.md` — edit it anytime.
- Your context files live at `~/.claude/ea-context/` — the EA reads and writes these automatically.
- Customize any skill by editing `~/.claude/commands/ea-*.md`.
- See `config/example-personality.md` in the repo for an example of a fully personalized profile.

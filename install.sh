#!/usr/bin/env bash
set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

EA_VERSION="1.0.0"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
CONTEXT_DIR="$CLAUDE_DIR/ea-context"
PROFILE="$CLAUDE_DIR/ea-profile.md"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "  My Executive Assistant v${EA_VERSION}"
echo "  ─────────────────────────────────────"
echo ""

# 1. Check for ~/.claude/ directory
if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "${RED}Error: ~/.claude/ directory not found.${NC}"
    echo ""
    echo "Please install Claude Code first:"
    echo "  https://docs.anthropic.com/en/docs/claude-code"
    exit 1
fi

# 2. Create commands directory if it doesn't exist
mkdir -p "$COMMANDS_DIR"

# 3. Copy all ea-* skill files (+ ea.md)
echo "Installing EA commands..."
count=0
for file in "$SCRIPT_DIR"/.claude/commands/ea*.md "$SCRIPT_DIR"/.claude/commands/ea.md; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")
    cp "$file" "$COMMANDS_DIR/$filename"
    name="${filename%.md}"
    echo "  ✓ /$name"
    count=$((count + 1))
done
echo "  $count commands installed."
echo ""

# 4. Create context directory and copy templates
echo "Setting up EA context files..."
mkdir -p "$CONTEXT_DIR"
for file in "$SCRIPT_DIR"/templates/context/*.md; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")
    if [ ! -f "$CONTEXT_DIR/$filename" ]; then
        cp "$file" "$CONTEXT_DIR/$filename"
        echo "  ✓ $filename"
    else
        echo -e "  ${YELLOW}~ $filename (already exists, keeping yours)${NC}"
    fi
done
echo ""

# 5. Copy profile template (only if not exists)
if [ ! -f "$PROFILE" ]; then
    cp "$SCRIPT_DIR/templates/ea-profile.md.template" "$PROFILE"
    echo "Created EA profile from template."
    echo -e "  ${YELLOW}Run /ea-setup to personalize it.${NC}"
else
    echo -e "${YELLOW}EA profile already exists — keeping your current profile.${NC}"
fi
echo ""

# 6. Write version file
echo "$EA_VERSION" > "$CONTEXT_DIR/.ea-version"

# 7. Add EA section to global CLAUDE.md (if not already present)
GLOBAL_CLAUDE="$CLAUDE_DIR/CLAUDE.md"
EA_START="<!-- EA-START -->"
EA_END="<!-- EA-END -->"
EA_BLOCK="$EA_START
# Executive Assistant
When any ea-* command is invoked, read ~/.claude/ea-profile.md for the user's EA profile, connected tools, and preferences. Read ~/.claude/ea-context/ files for current state.
$EA_END"

if [ -f "$GLOBAL_CLAUDE" ]; then
    if ! grep -q "$EA_START" "$GLOBAL_CLAUDE"; then
        echo "" >> "$GLOBAL_CLAUDE"
        echo "$EA_BLOCK" >> "$GLOBAL_CLAUDE"
        echo "Added EA config to global CLAUDE.md."
    else
        echo "EA config already in global CLAUDE.md."
    fi
else
    echo "$EA_BLOCK" > "$GLOBAL_CLAUDE"
    echo "Created global CLAUDE.md with EA config."
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  EA installed successfully!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "  Next steps:"
echo "  1. Open Claude Code in any project"
echo "  2. Run /ea-setup to personalize your EA"
echo "  3. Or jump right in with /ea-morning-brief"
echo ""
echo "  Run /ea-help to see all available commands."
echo ""

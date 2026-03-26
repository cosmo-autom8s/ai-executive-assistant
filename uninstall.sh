#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
CONTEXT_DIR="$CLAUDE_DIR/ea-context"
PROFILE="$CLAUDE_DIR/ea-profile.md"
GLOBAL_CLAUDE="$CLAUDE_DIR/CLAUDE.md"

echo ""
echo "  Uninstalling My Executive Assistant..."
echo ""

# 1. Remove EA commands
if [ -d "$COMMANDS_DIR" ]; then
    removed=0
    for file in "$COMMANDS_DIR"/ea-*.md "$COMMANDS_DIR"/ea.md; do
        [ -f "$file" ] || continue
        rm "$file"
        removed=$((removed + 1))
    done
    echo "  Removed $removed EA command(s)."
else
    echo "  No commands directory found."
fi

# 2. Ask about profile and context
echo ""
read -p "  Remove your EA profile and context files too? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    [ -f "$PROFILE" ] && rm "$PROFILE" && echo "  Removed EA profile."
    [ -d "$CONTEXT_DIR" ] && rm -rf "$CONTEXT_DIR" && echo "  Removed EA context files."
else
    echo -e "  ${YELLOW}Keeping your EA profile and context files.${NC}"
fi

# 3. Remove EA section from global CLAUDE.md (between markers)
if [ -f "$GLOBAL_CLAUDE" ]; then
    if grep -q "<!-- EA-START -->" "$GLOBAL_CLAUDE"; then
        sed '/<!-- EA-START -->/,/<!-- EA-END -->/d' "$GLOBAL_CLAUDE" > "${GLOBAL_CLAUDE}.tmp"
        mv "${GLOBAL_CLAUDE}.tmp" "$GLOBAL_CLAUDE"
        echo "  Removed EA config from global CLAUDE.md."
    fi
fi

echo ""
echo -e "${GREEN}  EA uninstalled.${NC}"
echo ""

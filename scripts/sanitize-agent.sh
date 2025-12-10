#!/bin/bash

# Script to help sanitize agent definitions from the original chezmoi repo
# Usage: ./sanitize-agent.sh <agent-name>

AGENT_NAME="$1"
CHEZMOI_REPO="/home/joba/.local/share/chezmoi"
COMMIT="f546112^"
OUTPUT_DIR="$(dirname "$0")/../agents"

if [ -z "$AGENT_NAME" ]; then
    echo "Usage: $0 <agent-name>"
    echo "Example: $0 architecture-agent"
    exit 1
fi

echo "Extracting $AGENT_NAME from git..."
git -C "$CHEZMOI_REPO" show "$COMMIT:agents/agent-definitions/$AGENT_NAME.md" > "/tmp/$AGENT_NAME.md"

if [ ! -f "/tmp/$AGENT_NAME.md" ]; then
    echo "Error: Could not extract agent definition"
    exit 1
fi

echo "Agent extracted to /tmp/$AGENT_NAME.md"
echo ""
echo "Manual sanitization steps:"
echo "1. Remove all LogSeq references:"
echo "   - Remove 'logseq-agent' invocations"
echo "   - Remove MCP tool references (create_block, replace_block, etc.)"
echo "   - Remove LogSeq page paths (projects/*, claude/memories/*, etc.)"
echo ""
echo "2. Remove language-specific content:"
echo "   - For elixir-reviewer: make generic for any language"
echo "   - Remove Phoenix/Ash/Ecto specifics"
echo "   - Replace with generic examples"
echo ""
echo "3. Remove personal references:"
echo "   - Project names (eden-platform, ash_ai, etc.)"
echo "   - Personal paths (/home/joba)"
echo ""
echo "4. Keep these sections:"
echo "   - YAML frontmatter (name, description, model, tools, color)"
echo "   - Agent Identity and responsibilities"
echo "   - Workflows and processes"
echo "   - Return Protocol"
echo ""
echo "5. Update tool lists for read-only agents:"
echo "   - Read-only: Read, Grep, Glob, WebSearch, WebFetch"
echo "   - Planners: Add Write, TodoWrite"
echo "   - Reviewers: Read-only"
echo ""
echo "When ready, edit /tmp/$AGENT_NAME.md and copy to $OUTPUT_DIR/$AGENT_NAME.md"

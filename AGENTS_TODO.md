# Claude Workflow Plugin Development

## Adding Agents

This plugin needs all agent definitions from the original system.

Agent definitions are stored as markdown files with YAML frontmatter in the
`agents/` directory.

## Current Status

✅ **ALL AGENTS COMPLETE** (12 agents)

- [x] research-agent
- [x] architecture-agent
- [x] feature-planner
- [x] qa-reviewer
- [x] senior-engineer-reviewer
- [x] security-reviewer
- [x] consistency-reviewer
- [x] factual-reviewer
- [x] redundancy-reviewer
- [x] documentation-expert
- [x] documentation-reviewer
- [x] code-quality-reviewer (generic language-agnostic code analysis)

## Agents Not Included

The following agents from the original system were intentionally excluded:

- **logseq-agent**: LogSeq-specific integration (not applicable to standalone
  plugin)
- **memory-agent**: LogSeq-specific memory storage (not applicable to standalone
  plugin)
- **elixir-reviewer**: Language-specific (replaced with generic
  code-quality-reviewer)

## Sanitization Rules

1. Remove all LogSeq references (logseq-agent, MCP tools)
2. Remove language-specific content (make generic)
3. Remove personal project names
4. Keep YAML frontmatter structure
5. Keep agent workflows and return protocols

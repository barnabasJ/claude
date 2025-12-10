---
description: Codebase impact analysis and pattern discovery for new features
argument-hint: [feature-name]
---

# Research Command

## Overview

Performs comprehensive codebase impact analysis for a proposed feature or
change. Maps all affected files, discovers existing patterns and conventions,
identifies dependencies, and gathers version-specific documentation. Creates
foundation for the plan phase.

Part of the four-phase workflow: research → plan → breakdown → execute

---

## Prerequisites

- Clear description of the feature or change to research
- Access to the codebase for pattern discovery
- Ability to read package files for dependency versions

---

## Workflow

### Step 1: Check Knowledge Base

Search `./notes/knowledge/` for similar work:

- `./notes/knowledge/hard-won-knowledge/` - Previous debugging insights
- `./notes/knowledge/technical-patterns/` - Implementation approaches
- `./notes/knowledge/project/` - Project-specific patterns

### Step 2: Create Task List

Use TodoWrite with tasks:

- Check knowledge base
- Analyze codebase impact
- Discover existing patterns
- Gather documentation
- Create research document
- Update knowledge base

### Step 3: Analyze Codebase Impact

Map all files requiring changes:

- Use Glob to find relevant files (`**/*pattern*.ext`)
- Use Grep to search for related code
- Read files to understand current implementation
- Note specific line numbers for reference

**Document:**

- Files affected with line numbers
- Dependencies between components
- Integration points
- Shared utilities that amplify impact

### Step 4: Discover Project Patterns

Analyze existing code to find:

- Package dependencies (mix.exs, package.json, etc.)
- Architectural patterns in use
- Testing approaches and frameworks
- Authentication/authorization patterns
- Naming conventions

🚨 **Discover what the project uses, not what it could use.**

### Step 5: Gather Documentation

Find version-specific docs for actual dependencies:

- Check package files for exact versions
- Link to specific version docs (e.g., hexdocs.pm/package/X.Y.Z)
- Include both official docs and community guides
- Note relevant GitHub repos for source reference

### Step 6: Create Research Document

Write findings to `./notes/research/[feature-name].md`

### Step 7: Update Knowledge Base

Document new learnings in `./notes/knowledge/`:

- Patterns discovered
- Useful documentation links
- Techniques that worked well

---

## Agent Consultations

| Agent              | When to Use                                      |
| ------------------ | ------------------------------------------------ |
| research-agent     | Deep technical research, documentation gathering |
| architecture-agent | Structural understanding, integration patterns   |
| qa-reviewer        | Test coverage analysis                           |

**Parallel pattern for algorithm research:**

```
Run in PARALLEL:
├── research-agent: "Research [Language] [Algorithm] patterns"
└── architecture-agent: "Map impact of changing [Module].[function]"
```

---

## Output

**Location**: `./notes/research/[feature-name].md`

**Required sections:**

1. **Overview** - What was researched and why
2. **Current Implementation** - What exists in the codebase
3. **File Impact Mapping** - Files and line numbers affected
4. **Dependencies** - Exact versions with doc links
5. **Existing Patterns** - Conventions discovered
6. **Third-Party Integrations** - External services detected
7. **Unclear Areas** - Questions for user clarification

**File references must include:**

- Full path: `lib/module/parser.ex`
- Line numbers: `parser.ex:70` or `lines 589-615`
- Function names: `Transformer.list_item_to_blocks/3`

---

## Critical Rules

🚨 **Do:**

- Discover project patterns FIRST before suggesting solutions
- Use version-specific documentation links (actual versions, not "latest")
- Include specific file paths and line numbers
- Check test files for usage examples and edge cases

🚨 **Don't:**

- Assume new dependencies without user approval
- Suggest patterns not established in the project
- Link to "latest" docs when project uses older version
- Stop at first file found - follow dependencies

---

## Example

**Input:** `/research markdown-todo-conversion`

**Process:**

```
1. Check knowledge base → No similar work found

2. Analyze codebase:
   - Glob **/*markdown*.ex → found parser.ex, renderer.ex, transformer.ex
   - Read parser.ex → Found TaskItem handling at line 70
   - Grep "checkbox" → Found in transformer.ex:589-615

3. Discover patterns:
   - mix.exs shows mdex 0.9.4
   - Uses GFM tasklist extension
   - Bidirectional conversion already exists

4. Gather docs:
   - https://hexdocs.pm/mdex/0.9.4
   - GFM spec for task lists

5. Document findings:
   - Parser: lib/app/markdown/parser.ex (TaskItem at :70)
   - Transformer: lib/app/markdown/transformer.ex (checkbox :589-615)
   - Renderer: lib/app/markdown/renderer.ex (round-trip)
   - Finding: Full conversion already implemented
```

**Output:** `./notes/research/markdown-todo-conversion.md`

---

## Common Pitfalls

- **Assuming missing functionality**: Always check tests - feature may already
  exist
- **Searching too narrowly**: Use multiple terms (todo, TaskItem, checkbox,
  tasklist)
- **Ignoring test files**: Tests show what already works and expected behavior
- **One-direction analysis**: For conversions, check BOTH directions
- **Outdated doc links**: Always verify docs match actual package version

# Claude Workflow System

This file provides guidance to Claude Code when working with this workflow
system.

## System Overview

You are working with a four-phase development workflow system designed for
systematic, high-quality software development:

1. **Research Phase** - Understand the codebase and map dependencies
2. **Plan Phase** - Design comprehensive implementation strategies
3. **Breakdown Phase** - Create detailed, testable task lists
4. **Execute Phase** - Implement with continuous quality checks

## Available Commands

All workflow commands are available as slash commands. The command definitions
are stored in the `commands/` directory.

### Core Workflow Commands

- `/research [feature-name]` - Codebase impact analysis
- `/plan [feature-name]` - Strategic implementation planning
- `/breakdown [feature-name]` - Task decomposition with TDD
- `/execute [feature-name]` - Implementation execution
- `/rpbe [feature-name]` - Full workflow (Research → Plan → Breakdown → Execute)

### Development Commands

- `/fix [issue-description]` - Bug fixing with root cause analysis
- `/commit` - Generate conventional commit messages

## Core Principles

### 1. Research Before Acting

Always understand the existing codebase before making changes:

- Identify existing patterns and conventions
- Map dependencies and affected files
- Find similar implementations to learn from
- Document third-party integrations

### 2. Progressive Refinement

Move from broad to specific:

- Research → High-level understanding
- Plan → Strategic approach with phases
- Breakdown → Granular, numbered tasks
- Execute → Implementation with continuous validation

### 3. Test-Driven Development

Tests are not afterthoughts:

- Plan includes test strategy
- Breakdown specifies test requirements for each task
- Execution follows red-green-refactor cycle
- 100% test pass rate before completing

### 4. Quality Gates

Each phase validates the previous:

- Research validates understanding
- Plan validates research completeness
- Breakdown validates plan feasibility
- Execute validates breakdown accuracy

### 5. Todo Management

Use the TodoWrite tool proactively:

- Create todos at the start of each phase
- Mark tasks in_progress before starting
- Complete tasks immediately after finishing
- Keep exactly ONE task in_progress at a time

## Workflow Integration

### When to Use Each Command

**Use /research when:**

- Starting work on a new feature
- Need to understand existing patterns
- Mapping dependencies and impact
- Unfamiliar with parts of the codebase

**Use /plan when:**

- Research phase is complete
- Need to design implementation strategy
- Defining phases and milestones
- Identifying risks and challenges

**Use /breakdown when:**

- Plan is approved and complete
- Ready for granular task decomposition
- Need specific, actionable steps
- Want test-first approach

**Use /execute when:**

- Breakdown is complete and validated
- Ready to write code
- Following test-driven development
- Implementing systematically

**Use /rpbe when:**

- User requests full workflow
- Starting from scratch on new work
- Want end-to-end automation
- Comfortable with interactive prompts

### Command Output Locations

Commands create structured documentation in your workspace (directories are
created automatically):

- Research: `./notes/research/[feature-name].md`
- Plan: `./notes/plans/[feature-name].md`
- Breakdown: `./notes/breakdowns/[feature-name].md`
- Execute: Working code + tests (no separate doc)
- Fix: `./notes/fixes/[issue-name].md`
- Knowledge: `./notes/knowledge/` (for learnings and patterns)

**Note**: No setup required - directories are created automatically by the Write
tool.

## Important Notes

### Do Not Over-Engineer

- Only make changes that are directly requested
- Don't add features beyond the scope
- Keep solutions simple and focused
- Trust internal code and framework guarantees
- Avoid premature abstractions

### File Operations

- ALWAYS prefer editing existing files over creating new ones
- Read files before editing them
- Use Edit tool for modifications
- Only create files when absolutely necessary

### Communication

- Output text directly to communicate with the user
- Never use echo or bash for communication
- Be concise and clear
- Show progress through todos

## Customization

This workflow system can be adapted to your project's needs:

1. **Edit command definitions** in `commands/` to adjust workflows
2. **Modify output locations** to match your project structure
3. **Add project-specific validation** rules to each phase
4. **Integrate with your tools** (CI/CD, issue trackers, etc.)

See `docs/customization-guide.md` for detailed guidance.

## Getting Help

- Read command definitions in `commands/` to understand workflows
- Check `docs/getting-started.md` for step-by-step guidance
- Review `docs/workflow-overview.md` for philosophy and best practices

## Version

Version: 1.0.0 Last Updated: 2025-12-02

# Getting Started with Essentials Plugin

## Introduction

The Essentials plugin provides a four-phase development workflow for systematic,
high-quality software development with Claude Code.

## Installation

### From GitHub

```bash
# Add the marketplace (one-time setup)
claude plugin marketplace add https://github.com/OWNER/REPO

# Install the plugin
claude plugin install essentials
```

### From Local Path

```bash
# Add marketplace from local directory
claude plugin marketplace add /path/to/essentials-marketplace

# Install the plugin
claude plugin install essentials
```

### Verify Installation

After installation, the workflow commands should be available. Start Claude Code
and try:

```bash
/research --help
```

## Your First Feature

Let's walk through implementing a simple feature: adding input validation to a
form.

### Step 1: Research (Understanding the Codebase)

```bash
/research form-validation
```

**What Claude does:**

1. Searches for existing validation patterns
2. Finds similar form handling code
3. Maps files that need changes
4. Documents dependencies
5. Consults the research-agent for thorough analysis

**Output:** `./notes/research/form-validation.md`

**Review the research document** to understand:

- How validation is currently done
- What patterns exist
- What files will be affected

### Step 2: Plan (Designing the Approach)

```bash
/plan form-validation
```

**What Claude does:**

1. Reads the research document
2. Consults architecture-agent for design guidance
3. Designs implementation strategy
4. Breaks work into logical phases
5. Plans test strategy

**Output:** `./notes/plans/form-validation.md`

**Review the plan** to ensure:

- Strategy makes sense
- Phases are logical
- Risks are identified
- Tests are considered

### Step 3: Breakdown (Creating Task List)

```bash
/breakdown form-validation
```

**What Claude does:**

1. Reads the plan document
2. Creates numbered, granular tasks
3. Specifies tests for each task
4. Orders tasks by dependencies

**Output:** `./notes/breakdowns/form-validation.md`

**Review the breakdown** to verify:

- Tasks are small enough (15-30 min each)
- Tests are specified
- Order makes sense
- Acceptance criteria are clear

### Step 4: Execute (Implementation)

```bash
/execute form-validation
```

**What Claude does:**

1. Follows tasks in order
2. Writes tests first (RED)
3. Implements to pass tests (GREEN)
4. Refactors for quality
5. Runs review agents for quality assurance

**Output:** Working code + tests in your codebase

### Step 5: Commit

```bash
/commit
```

**What Claude does:**

1. Analyzes changes
2. Generates conventional commit message
3. Creates commit

## Quick Start (All Phases at Once)

Run all phases automatically with interactive checkpoints:

```bash
/rpbe form-validation
```

This runs Research → Plan → Breakdown → Execute in sequence.

## Available Commands

### Workflow Commands

| Command      | Purpose                                               |
| ------------ | ----------------------------------------------------- |
| `/research`  | Codebase impact analysis and dependency mapping       |
| `/plan`      | Strategic implementation planning                     |
| `/breakdown` | Task decomposition with TDD requirements              |
| `/execute`   | Systematic implementation with quality gates          |
| `/rpbe`      | Full workflow (Research → Plan → Breakdown → Execute) |

### Development Commands

| Command   | Purpose                                |
| --------- | -------------------------------------- |
| `/fix`    | Bug fixing with root cause analysis    |
| `/commit` | Conventional commit message generation |

## Available Agents

The plugin includes specialized agents that commands consult automatically:

### Research & Planning

- **research-agent** - Technical documentation and codebase research
- **architecture-agent** - System design and architectural analysis
- **feature-planner** - Feature planning and task breakdown

### Code Review

- **qa-reviewer** - Testing coverage analysis
- **security-reviewer** - Security vulnerability assessment
- **code-quality-reviewer** - Language-agnostic code quality checks
- **senior-engineer-reviewer** - Strategic technical review

### Validation

- **consistency-reviewer** - Pattern and convention consistency
- **factual-reviewer** - Plan vs implementation verification
- **redundancy-reviewer** - Code duplication detection

### Documentation

- **documentation-expert** - Documentation creation
- **documentation-reviewer** - Documentation quality review

## Output Locations

Commands create documentation in `./notes/` (created automatically):

```
./notes/
├── research/      # Research documents
├── plans/         # Plan documents
├── breakdowns/    # Task breakdowns
├── fixes/         # Bug fix documentation
└── knowledge/     # Learnings and patterns
```

## Tips for Success

### 1. Start Small

Try the workflow on something manageable first:

- Add validation to a form
- Add a new API endpoint
- Implement a utility function

### 2. Review Between Phases

Don't blindly accept each phase's output:

- Check research found relevant patterns
- Verify plan addresses requirements
- Ensure breakdown tasks are clear
- Monitor execution progress

### 3. Trust the Agents

The specialized agents provide expert guidance:

- Research-agent finds relevant patterns
- Architecture-agent validates design decisions
- Review agents catch quality issues

### 4. Use Quality Gates

Before each phase, validate the previous:

- Research complete? → Plan
- Plan solid? → Breakdown
- Breakdown clear? → Execute
- Tests pass? → Commit

## Troubleshooting

### "Commands not available"

**Check:**

- Is the plugin installed? (`claude plugin list`)
- Try reinstalling:
  `claude plugin uninstall essentials && claude plugin install essentials`

### "Research found nothing useful"

**Solutions:**

- Broaden your search terms
- The codebase may be new - that's OK, document what patterns to establish

### "Plan is too vague"

**Solutions:**

- Review research more thoroughly
- Break into more phases
- The architecture-agent will help with specifics

### "Tests keep failing"

**Solutions:**

- Read error messages carefully
- The qa-reviewer agent validates test coverage
- Check test requirements from breakdown

## Next Steps

- Read [Workflow Overview](./workflow-overview.md) for deeper understanding
- Study [Agent Patterns](./agent-patterns.md) for agent usage
- Check [Customization Guide](./customization-guide.md) for adapting workflows

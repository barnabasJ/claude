# Getting Started with Claude Workflow Plugin

## Introduction

Welcome to the Claude Workflow Plugin! This guide will help you get started with
the four-phase development workflow.

## Installation

### Step 1: Get the Plugin

```bash
# Clone or download the plugin
cd your-project
cp -r path/to/claude-workflow-plugin .
```

### Step 2: Verify Installation

Claude Code automatically detects the `CLAUDE.md` file. Start Claude Code in
your project directory:

```bash
cd your-project
claude
```

You should see the workflow commands available.

### Step 3: Create Output Directories

The workflow creates documentation in specific directories. Create them:

```bash
mkdir -p docs/{research,plans,breakdowns}
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

**Output:** `./docs/research/form-validation.md`

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
2. Designs implementation strategy
3. Breaks work into logical phases
4. Identifies risks
5. Plans test strategy

**Output:** `./docs/plans/form-validation.md`

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

**Output:** `./docs/breakdowns/form-validation.md`

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
5. Validates acceptance criteria

**Output:** Working code + tests in your codebase

**Monitor progress:**

- Watch as tasks complete
- Verify tests pass
- Check code quality

### Step 5: Commit

```bash
/commit
```

**What Claude does:**

1. Analyzes changes
2. Generates conventional commit message
3. Creates commit

**Result:** Clean git history with proper commit message

## Quick Start (All Phases at Once)

Want to run all phases automatically?

```bash
/rpbe form-validation
```

This runs Research → Plan → Breakdown → Execute in sequence with interactive
checkpoints between phases.

## Common Use Cases

### Adding a New Feature

```bash
# Option 1: Full workflow
/rpbe add-user-profile

# Option 2: Step by step
/research add-user-profile
# ... review ...
/plan add-user-profile
# ... review ...
/breakdown add-user-profile
# ... review ...
/execute add-user-profile
```

### Fixing a Bug

```bash
/fix login-button-not-working
```

This command:

1. Helps diagnose root cause
2. Creates regression test
3. Implements fix
4. Validates no new issues

### Making Quick Changes

For very small changes where full workflow isn't needed:

- Just use Claude Code normally
- The workflow is for substantial work
- Use your judgment

## Understanding the Output

### Research Documents

Located in `./docs/research/[feature].md`

Contains:

- Existing patterns found
- Files to create/modify
- Dependencies identified
- Similar implementations
- Complexity assessment

**Use this to:** Understand the landscape before planning

### Plan Documents

Located in `./docs/plans/[feature].md`

Contains:

- Implementation strategy
- Phases with deliverables
- Risks and mitigation
- Test strategy
- Success criteria

**Use this to:** Guide the breakdown and execution

### Breakdown Documents

Located in `./docs/breakdowns/[feature].md`

Contains:

- Numbered, granular tasks
- Test requirements per task
- Acceptance criteria
- Dependencies
- Files affected

**Use this to:** Track implementation progress

## Tips for Success

### 1. Start Small

Don't begin with your most complex feature. Try the workflow on something
manageable first:

- Add validation to a form
- Add a new API endpoint
- Implement a utility function

### 2. Review Between Phases

Don't blindly accept each phase's output:

- Check research found relevant patterns
- Verify plan addresses requirements
- Ensure breakdown tasks are clear
- Monitor execution progress

### 3. Adjust as Needed

The workflow is a guide, not a straitjacket:

- Skip phases for trivial changes
- Iterate if requirements change
- Adapt output locations to your project
- Customize commands for your needs

### 4. Learn the Patterns

Pay attention to:

- How research guides planning
- How plans inform breakdowns
- How tests drive implementation
- How quality gates prevent issues

### 5. Use Quality Gates

Before each phase, validate the previous:

- Research complete? → Plan
- Plan solid? → Breakdown
- Breakdown clear? → Execute
- Tests pass? → Commit

## Troubleshooting

### "I don't see the slash commands"

**Check:**

- Is CLAUDE.md in your project root?
- Did you start Claude Code in the right directory?
- Try restarting Claude Code

### "Research found nothing useful"

**Solutions:**

- Broaden your search terms
- Look in different directories
- Check if this is truly novel (no similar code)
- Use web search for external patterns

### "Plan is too vague"

**Solutions:**

- Review research more thoroughly
- Break into more phases
- Ask for clarification on requirements
- Consult documentation or examples

### "Breakdown tasks are too large"

**Solutions:**

- Break tasks down further
- Aim for 15-30 minutes per task
- Each task should do ONE thing
- Split into smaller acceptance criteria

### "Tests keep failing"

**Solutions:**

- Read error messages carefully
- Debug one test at a time
- Check test requirements from breakdown
- Verify implementation matches acceptance criteria

## Next Steps

### Learn More

- Read [Workflow Overview](./workflow-overview.md) for deeper understanding
- Study [Agent Patterns](./agent-patterns.md) for advanced techniques
- Check command definitions in `commands/` for details

### Customize

- Edit command files to adjust workflows
- Change output directories to match your project
- Add your own commands for specific needs

### Share Feedback

- Document what works well
- Note what could improve
- Adapt the workflow to your team

## Example Workflow Session

Here's what a complete session looks like:

```
You: /rpbe add-email-validation

Claude: I'll implement email validation using the four-phase workflow.

[Phase 1: Research]
Analyzing existing validation patterns...
Found 3 similar implementations in:
- src/forms/LoginForm.js
- src/utils/validators.js
- src/components/Input.js

Research complete: ./docs/research/add-email-validation.md

Ready to proceed to planning? [yes/no]

You: yes

[Phase 2: Plan]
Designing implementation strategy...
Plan complete with 3 phases:
1. Create email validator utility
2. Integrate with form component
3. Add comprehensive tests

Plan saved: ./docs/plans/add-email-validation.md

Ready to create detailed breakdown? [yes/no]

You: yes

[Phase 3: Breakdown]
Creating task breakdown...
Generated 8 tasks with test requirements
Estimated complexity: Medium

Breakdown saved: ./docs/breakdowns/add-email-validation.md

Ready to execute implementation? [yes/no]

You: yes

[Phase 4: Execute]
Starting implementation...

Task 1/8: Create email validation regex
- Writing tests... ✓
- Implementing validator... ✓
- Tests passing... ✓

Task 2/8: Add validation to input component
- Writing tests... ✓
- Integrating validator... ✓
- Tests passing... ✓

[... continues through all tasks ...]

Task 8/8: Add documentation
- Updating README... ✓
- Adding usage examples... ✓
- Complete ✓

All phases complete!
- Research: ✓
- Plan: ✓
- Breakdown: ✓
- Execute: ✓
- Tests passing: 28/28 ✓

Ready to commit? [yes/no]

You: yes

[Commit]
Analyzing changes...
Generated commit message:

feat(validation): add email validation to form inputs

Implement comprehensive email validation with regex pattern
supporting common formats and international domains. Includes
validation utility, form integration, and extensive test coverage.

Commit created successfully!
```

## Welcome Aboard!

You're now ready to use the Claude Workflow Plugin. Start with a small feature,
follow the phases, and experience systematic software development.

Happy coding! 🚀

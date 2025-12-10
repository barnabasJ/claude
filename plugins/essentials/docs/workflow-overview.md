# Workflow Overview

## Introduction

The Essentials plugin implements a four-phase development methodology for
systematic, high-quality software development with AI assistance.

## Philosophy

### Core Beliefs

1. **Understand Before Acting** - Research prevents costly mistakes
2. **Plan Before Coding** - Strategy beats improvisation
3. **Break Down Complexity** - Small tasks are manageable tasks
4. **Test-Drive Implementation** - Tests guide development
5. **Validate Continuously** - Quality gates prevent regression

### Why Four Phases?

Each phase builds on the previous and catches issues early:

- **Research** builds understanding before committing to a design
- **Plan** structures the approach before diving into details
- **Breakdown** reveals gaps in the plan before coding starts
- **Execute** implements with confidence because the groundwork is solid

## The Four Phases

### Phase 1: Research

**Goal**: Understand the codebase and map the landscape

**Command**: `/research [feature-name]`

**Key Activities**:

- Find similar implementations
- Map affected files
- Document dependencies
- Assess complexity

**Agent Consultation**: research-agent performs thorough codebase analysis

**Output**: `./notes/research/[feature-name].md`

**Why This Matters**:

- Prevents surprises during implementation
- Identifies reusable patterns
- Reveals hidden dependencies
- Informs realistic planning

### Phase 2: Plan

**Goal**: Design a comprehensive implementation strategy

**Command**: `/plan [feature-name]`

**Key Activities**:

- Define architecture approach
- Break work into phases
- Identify risks
- Plan test strategy

**Agent Consultation**: architecture-agent validates design decisions

**Output**: `./notes/plans/[feature-name].md`

**Why This Matters**:

- Creates shared understanding
- Identifies risks early
- Enables parallel work
- Guides breakdown phase

### Phase 3: Breakdown

**Goal**: Transform strategy into actionable tasks

**Command**: `/breakdown [feature-name]`

**Key Activities**:

- Create numbered, granular tasks
- Specify test requirements for each task
- Order by dependencies
- Define acceptance criteria

**Agent Consultation**: feature-planner helps with task decomposition

**Output**: `./notes/breakdowns/[feature-name].md`

**Why This Matters**:

- Makes progress measurable
- Enables test-driven development
- Clarifies dependencies
- Provides clear stopping points

### Phase 4: Execute

**Goal**: Implement systematically with continuous validation

**Command**: `/execute [feature-name]`

**Key Activities**:

- Follow test-driven development
- Implement tasks in order
- Validate continuously
- Maintain quality

**Agent Consultation**: Review agents (qa-reviewer, security-reviewer,
code-quality-reviewer) validate implementation quality

**Output**: Working, tested code

**Why This Matters**:

- Produces quality code
- Prevents regressions
- Maintains test coverage
- Delivers working software

## Workflow Patterns

### Linear Workflow (RPBE)

Execute all four phases sequentially:

```
Research → Plan → Breakdown → Execute → Done
```

**Command**: `/rpbe [feature-name]`

**Use When**:

- Starting fresh on new work
- Feature scope is clear
- Time allows full workflow

### Phase-by-Phase

Execute individual phases with review between each:

```
/research → review → /plan → review → /breakdown → review → /execute
```

**Use When**:

- Need review between phases
- Multiple stakeholders
- High-risk changes

### Bug Fix Workflow

For fixing bugs with root cause analysis:

```
/fix [issue-description]
```

**Use When**:

- Addressing a specific bug
- Need regression test
- Want systematic diagnosis

## Test-Driven Development

### The Red-Green-Refactor Cycle

```
1. RED: Write failing test
2. GREEN: Make test pass (minimal code)
3. REFACTOR: Improve code quality
4. REPEAT: For next requirement
```

### Why TDD in This Workflow?

1. **Tests guide design**: Writing tests first clarifies requirements
2. **Immediate feedback**: Know immediately if code works
3. **Regression prevention**: Tests catch future breaks
4. **Refactoring confidence**: Change code without fear
5. **Documentation**: Tests show how code should be used

## Quality Gates

### Research Gate

**Before proceeding to planning:**

- Have I found similar implementations?
- Are dependencies fully mapped?
- Do I understand existing patterns?
- Is complexity assessed realistically?

### Planning Gate

**Before proceeding to breakdown:**

- Is implementation strategy clear?
- Are phases logical and achievable?
- Have I identified key risks?
- Is test strategy defined?

### Breakdown Gate

**Before proceeding to execution:**

- Is every task granular and actionable?
- Does every task have test requirements?
- Are dependencies correctly ordered?
- Are acceptance criteria clear?

### Execution Gate

**Before marking complete:**

- Do all tests pass?
- Did I follow TDD?
- Are all tasks completed?
- No regressions introduced?

## Agent Integration

The workflow commands automatically consult specialized agents:

### During Research

- **research-agent**: Performs thorough codebase analysis

### During Planning

- **architecture-agent**: Validates architectural decisions
- **feature-planner**: Helps structure implementation phases

### During Execution

- **qa-reviewer**: Validates test coverage
- **security-reviewer**: Checks for vulnerabilities
- **code-quality-reviewer**: Ensures code quality
- **consistency-reviewer**: Validates pattern consistency
- **factual-reviewer**: Verifies plan vs implementation

## Tips for Success

### 1. Don't Skip Phases

Tempting to jump straight to coding, but:

- Research prevents false starts
- Planning prevents rework
- Breakdown prevents confusion
- Following process saves time overall

### 2. Keep Tasks Small

In breakdown phase:

- Task takes > 30 min? Break it down more
- Can't write clear acceptance criteria? Too vague
- Dependencies unclear? Task too large

### 3. Write Tests First

Always:

- Forces you to think about behavior
- Confirms tests actually test something
- Gives immediate feedback
- Prevents "test later" (which never happens)

### 4. Trust the Agents

The specialized agents catch issues you might miss:

- Security vulnerabilities
- Test coverage gaps
- Inconsistent patterns
- Code quality issues

## Anti-Patterns to Avoid

### 1. Skipping Research

**Problem**: Jump straight to coding **Result**: Miss existing patterns,
reinvent wheels **Fix**: Always start with research phase

### 2. Vague Plans

**Problem**: Plan lacks specifics **Result**: Breakdown phase is difficult
**Fix**: Make plans concrete with clear phases

### 3. Large Tasks

**Problem**: Breakdown tasks are too big **Result**: Can't follow TDD, hard to
track **Fix**: Break tasks until they're 15-30 minutes each

### 4. Tests After Code

**Problem**: Write code then add tests **Result**: Code hard to test, tests miss
edge cases **Fix**: Always write tests first

### 5. Ignoring Agent Feedback

**Problem**: Dismiss review agent findings **Result**: Quality issues ship to
production **Fix**: Address all agent concerns before completion

## Summary

The four-phase workflow provides:

- **Structure** without rigidity
- **Quality gates** without bureaucracy
- **Test-driven** approach without dogma
- **Agent assistance** for expert guidance

Key principles:

1. Understand before acting (Research)
2. Plan before coding (Plan)
3. Break down complexity (Breakdown)
4. Test-drive implementation (Execute)
5. Trust the agents (Quality Assurance)

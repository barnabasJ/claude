# Workflow Overview

## Introduction

The Claude Workflow Plugin implements a four-phase development methodology
designed for systematic, high-quality software development with AI assistance.

## Philosophy

### Core Beliefs

1. **Understand Before Acting** - Research prevents costly mistakes
2. **Plan Before Coding** - Strategy beats improvisation
3. **Break Down Complexity** - Small tasks are manageable tasks
4. **Test-Drive Implementation** - Tests guide development
5. **Validate Continuously** - Quality gates prevent regression

### Why Four Phases?

Each phase serves a specific purpose and validates the previous phase:

- **Research** validates understanding
- **Plan** validates research completeness
- **Breakdown** validates plan feasibility
- **Execute** validates breakdown accuracy

## The Four Phases

### Phase 1: Research

**Goal**: Understand the codebase and map the landscape

**Key Activities**:

- Find similar implementations
- Map affected files
- Document dependencies
- Assess complexity

**Output**: Comprehensive research document

**Duration**: 15-30% of total time

**Why This Matters**:

- Prevents surprises during implementation
- Identifies reusable patterns
- Reveals hidden dependencies
- Informs realistic planning

### Phase 2: Plan

**Goal**: Design a comprehensive implementation strategy

**Key Activities**:

- Define architecture approach
- Break work into phases
- Identify risks
- Plan test strategy

**Output**: Strategic plan document

**Duration**: 15-25% of total time

**Why This Matters**:

- Creates shared understanding
- Identifies risks early
- Enables parallel work
- Guides breakdown phase

### Phase 3: Breakdown

**Goal**: Transform strategy into actionable tasks

**Key Activities**:

- Create numbered, granular tasks
- Specify test requirements for each task
- Order by dependencies
- Define acceptance criteria

**Output**: Detailed task breakdown

**Duration**: 10-20% of total time

**Why This Matters**:

- Makes progress measurable
- Enables test-driven development
- Clarifies dependencies
- Provides clear stopping points

### Phase 4: Execute

**Goal**: Implement systematically with continuous validation

**Key Activities**:

- Follow test-driven development
- Implement tasks in order
- Validate continuously
- Maintain quality

**Output**: Working, tested code

**Duration**: 40-60% of total time

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

**Use When**:

- Starting fresh on new work
- Feature scope is clear
- Time allows full workflow

**Benefits**:

- Systematic and thorough
- Catches issues early
- High-quality results

### Iterative Workflow

Execute phases in cycles:

```
Research → Plan → Breakdown → Execute →
↑__________ feedback loop __________↓
```

**Use When**:

- Requirements evolve
- Learning as you go
- Large features

**Benefits**:

- Adapts to learning
- Allows course correction
- Manages uncertainty

### Phase-by-Phase

Execute individual phases as needed:

```
/research → review → /plan → review → /breakdown → review → /execute
```

**Use When**:

- Need review between phases
- Multiple stakeholders
- High-risk changes

**Benefits**:

- Control over each phase
- Opportunity for feedback
- Explicit approval points

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

### TDD at Each Phase

**Research Phase**:

- Note how existing features are tested
- Identify test utilities and helpers

**Planning Phase**:

- Define overall test strategy
- Plan test data requirements

**Breakdown Phase**:

- Specify tests for each task
- Include test requirements in acceptance criteria

**Execute Phase**:

- Write test first (RED)
- Implement to pass (GREEN)
- Refactor with confidence

## Quality Gates

### What Are Quality Gates?

Checkpoints that ensure quality before proceeding to the next phase.

### Research Gate

**Before proceeding to planning, ask:**

- ✅ Have I found similar implementations?
- ✅ Are dependencies fully mapped?
- ✅ Do I understand existing patterns?
- ✅ Is complexity assessed realistically?

### Planning Gate

**Before proceeding to breakdown, ask:**

- ✅ Is implementation strategy clear?
- ✅ Are phases logical and achievable?
- ✅ Have I identified key risks?
- ✅ Is test strategy defined?

### Breakdown Gate

**Before proceeding to execution, ask:**

- ✅ Are tasks granular enough (15-30 min each)?
- ✅ Does every task have test requirements?
- ✅ Are dependencies correct?
- ✅ Are acceptance criteria clear?

### Execution Gate

**Before marking complete, ask:**

- ✅ Do all tests pass?
- ✅ Did I follow TDD?
- ✅ Are all tasks completed?
- ✅ No regressions introduced?

## Common Patterns

### Starting a New Feature

```bash
# Option 1: Full workflow
/rpbe add-user-authentication

# Option 2: Phase by phase
/research add-user-authentication
# ... review research ...
/plan add-user-authentication
# ... review plan ...
/breakdown add-user-authentication
# ... review breakdown ...
/execute add-user-authentication
```

### Fixing a Bug

```bash
/fix login-validation-error
# Systematically diagnoses and fixes with regression test
```

### Finishing Up

```bash
/commit
# Generates conventional commit message
```

## Tips for Success

### 1. Don't Skip Phases

Tempting to jump straight to coding, but:

- Research prevents false starts
- Planning prevents rework
- Breakdown prevents confusion
- Following process saves time overall

### 2. Trust the Process

The phases feel like overhead initially, but:

- They catch issues early (cheaper to fix)
- They prevent confusion mid-implementation
- They produce better quality code
- They make progress measurable

### 3. Keep Tasks Small

In breakdown phase:

- Task takes > 30 min? Break it down more
- Can't write clear acceptance criteria? Too vague
- Dependencies unclear? Task too large

### 4. Write Tests First

Always:

- Forces you to think about behavior
- Confirms tests actually test something
- Gives immediate feedback
- Prevents "test later" (which never happens)

### 5. Commit Frequently

After each completed task:

- Makes progress visible
- Enables easy rollback
- Creates clear history
- Reduces risk

## Anti-Patterns to Avoid

### 1. Skipping Research

**Problem**: Jump straight to coding **Result**: Miss existing patterns,
reinvent wheels, create inconsistencies **Fix**: Always start with research
phase

### 2. Vague Plans

**Problem**: Plan lacks specifics **Result**: Breakdown phase is difficult,
execution is confused **Fix**: Make plans concrete with clear phases and
deliverables

### 3. Large Tasks

**Problem**: Breakdown tasks are too big **Result**: Can't follow TDD, hard to
track progress **Fix**: Break tasks until they're 15-30 minutes each

### 4. Tests After Code

**Problem**: Write code then add tests **Result**: Code hard to test, tests miss
edge cases, low quality **Fix**: Always write tests first (RED → GREEN →
REFACTOR)

### 5. Ignoring Quality Gates

**Problem**: Proceed to next phase with incomplete work **Result**: Issues
compound, rework required **Fix**: Validate at each gate before proceeding

## Customization

### Adapting to Your Project

**Output Locations**: Edit command files to change where documents are created

**Phase Definitions**: Adjust phase templates in plan command for your domain

**Task Granularity**: Change task duration targets in breakdown command

**Test Requirements**: Customize test expectations for your project's needs

### Adding Your Own Commands

Create new command files in `commands/` directory following the same structure:

- Overview
- When to Use
- Prerequisites
- Workflow Steps
- Success Criteria
- Critical Rules

## Summary

The four-phase workflow provides:

- **Structure** without rigidity
- **Quality gates** without bureaucracy
- **Test-driven** approach without dogma
- **Documentation** without overhead

Key principles:

1. Understand before acting (Research)
2. Plan before coding (Plan)
3. Break down complexity (Breakdown)
4. Test-drive implementation (Execute)
5. Validate continuously (Quality Gates)

Start with `/rpbe [feature]` and experience the systematic approach to software
development.

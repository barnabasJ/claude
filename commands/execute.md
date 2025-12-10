---
description: Implementation execution following breakdown checklist with TDD
argument-hint: [feature-name]
---

# Execute Command

## Overview

Implements the detailed breakdown checklist task by task, following TDD
workflow. You are the implementation lead: write code, create tests, make
commits, and track progress. Consult agents for guidance when needed.

Final phase of: research → plan → breakdown → execute

---

## Prerequisites

- Breakdown completed at `./notes/breakdowns/[feature-name].md`
- Development environment ready (tests can run)
- Understanding of project patterns from research phase

---

## Workflow

### Step 1: Check Knowledge Base

Search `./notes/knowledge/` BEFORE starting:

- `./notes/knowledge/hard-won-knowledge/` - Previous solutions
- `./notes/knowledge/technical-patterns/` - Implementation patterns
- `./notes/knowledge/project/` - Project-specific approaches

🚨 **Check knowledge base before debugging ANY problem.**

### Step 2: Create Task List from Breakdown

Read `./notes/breakdowns/[feature-name].md` and use TodoWrite to create tasks:

- One task per numbered item in breakdown
- Mark tasks in_progress before starting
- Mark completed immediately after finishing
- Keep exactly ONE task in_progress at a time

### Step 3: Execute Tasks Sequentially

For each task in the breakdown:

**3a. Start task**

- Mark task as in_progress in TodoWrite
- Read task requirements from breakdown

**3b. Follow TDD cycle**

1. Write failing test (RED)
2. Implement minimal code to pass (GREEN)
3. Refactor if needed (REFACTOR)
4. Run test suite
5. Verify all tests pass

**3c. Commit**

- Use suggested commit message from breakdown
- Only commit when tests pass

**3d. Track progress**

- Mark substasks as `[x]` in breakdown document
- Mark task as completed in TodoWrite
- Move to next task

### Step 4: Quality Gates

**After each task:**

- All task tests pass
- Code follows project patterns

**After 3-4 related tasks:**

- Run review agents (qa-reviewer, code-quality-reviewer)
- Address issues before continuing

**After all tasks:**

- Run full test suite
- Run all review agents
- Verify success criteria from breakdown

### Step 5: Update Knowledge Base

Document learnings in `./notes/knowledge/`:

- Implementation patterns that worked
- Problems solved and solutions
- Testing techniques used

---

## Zero-Tolerance Test Policy

🚨 **Tasks are NOT complete with failing tests.**

**When tests fail:**

1. STOP all other work
2. Check knowledge base for similar issues
3. Debug and fix root cause
4. Verify fix with full test suite
5. Only then continue

**Never:**

- Mark task complete with failing tests
- Delete or skip tests without user approval
- Comment out failing tests
- Commit with failing tests

---

## Knowledge-First Debugging

🚨 **Check knowledge base BEFORE debugging any problem.**

When you encounter an error:

1. Search `./notes/knowledge/hard-won-knowledge/` for similar errors
2. Search `./notes/knowledge/technical-patterns/` for tech-specific solutions
3. Check `./notes/knowledge/project/` for project approaches

**After solving a problem:**

- Store solution immediately in `./notes/knowledge/hard-won-knowledge/`
- Include: problem, symptoms, solution, why it works

---

## Agent Consultations

| Agent                 | When to Use                 |
| --------------------- | --------------------------- |
| qa-reviewer           | Test coverage validation    |
| code-quality-reviewer | Pattern consistency, naming |
| architecture-agent    | Integration validation      |
| research-agent        | Retrieve technical details  |

**Consult agents when:**

- Unclear about implementation approach
- Multiple valid options exist
- Need pattern guidance
- Validating integration approach

**Ask specific questions:**

```
"I'm implementing OAuth callback. The breakdown says to use
lib/app_web/controllers/auth_controller.ex. Looking at existing
controllers, should I use Phoenix actions or Ash actions?"
```

---

## Progress Tracking

**In breakdown document:**

```markdown
### 1. [x] Add User Resource ✅ 2025-12-10

- [x] 1.1 Create user resource
- [x] 1.2 Write tests
- [x] 1.3 Add attributes Commit: abc123f
```

**In TodoWrite:**

- Update status as you work
- Mark completed immediately
- Keep one in_progress at a time

---

## Critical Rules

🚨 **Do:**

- Check knowledge base before debugging ANY problem
- Follow TDD: test first, then implement
- Run tests after every substep
- Commit only when tests pass
- Store solutions immediately after solving problems
- Mark progress in breakdown document and TodoWrite

🚨 **Don't:**

- Skip test substeps
- Commit with failing tests
- Continue past failed tests
- Delete tests without user approval
- Debug without checking knowledge base first

---

## Example

**Input:** `/execute user-authentication`

**Process:**

```
1. Read breakdown: ./notes/breakdowns/user-authentication.md
   - Task 1: Add User Resource
   - Task 2: Configure OAuth
   - Task 3: Add Tests

2. Create TodoWrite tasks from breakdown

3. Execute Task 1:
   - Mark in_progress
   - 1.1 Create user.ex (follow pattern from organization.ex)
   - 1.2 Write user_test.exs
   - 1.3 Add email, password attributes
   - 1.4 Run tests → pass
   - Commit: "feat(accounts): add user resource"
   - Mark completed

4. Execute Task 2:
   - Mark in_progress
   - 2.1 Add ueberauth to mix.exs
   - 2.2 Write auth_controller_test.exs
   - 2.3 Create auth_controller.ex
   - 2.4 Run tests → FAIL
   - Check knowledge base → found OAuth callback solution
   - Apply fix
   - Run tests → pass
   - Commit: "feat(auth): configure OAuth"
   - Store solution in knowledge base
   - Mark completed

5. Run review agents
6. Update knowledge base with learnings
```

---

## Common Pitfalls

- **Skipping knowledge base check**: Always check before debugging
- **Batch completing tasks**: Mark each task complete immediately
- **Ignoring test failures**: Stop and fix, never continue
- **Vague agent questions**: Ask specific, contextual questions
- **Forgetting to store solutions**: Save to knowledge base immediately

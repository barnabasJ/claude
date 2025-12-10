---
description:
  Task decomposition with TDD - creates numbered checklists from plans
argument-hint: [feature-name]
---

# Breakdown Command

## Overview

Transforms strategic plans into granular, numbered task checklists with
test-first requirements. Each task includes specific file references,
documentation links, and commit guidance. Creates the executable checklist for
the execute phase.

Part of the four-phase workflow: research → plan → breakdown → execute

---

## Prerequisites

- Plan phase completed with document at `./notes/plans/[feature-name].md`
- Plan includes phases, technical design, and success criteria

---

## Workflow

### Step 1: Check Knowledge Base

Search `./notes/knowledge/` for:

- Similar task breakdowns
- Task decomposition patterns
- Testing methodology guidance

### Step 2: Create Task List

Use TodoWrite with tasks:

- Check knowledge base
- Read and analyze plan
- Design task structure
- Create numbered checklist
- Add TDD requirements
- Create breakdown document
- Update knowledge base

### Step 3: Read Strategic Plan

Read `./notes/plans/[feature-name].md` and extract:

- Implementation phases
- Technical design details
- File references and patterns
- Success criteria

### Step 4: Design Task Structure

**Task sizing guidelines:**

| Size | Duration  | Example                        |
| ---- | --------- | ------------------------------ |
| XS   | 15-30 min | Config change, add attribute   |
| S    | 30-60 min | Simple feature with tests      |
| M    | 1-2 hours | Resource with multiple actions |
| L    | 2-4 hours | Multi-file integration         |
| XL   | 4+ hours  | Split into smaller tasks       |

**Each task should be:**

- Independently executable
- Self-contained with all needed info
- Testable with clear criteria
- Completable with a single commit

### Step 5: Create Numbered Checklist

**Task format:**

```markdown
X. [ ] **Task Name**

Prerequisites: [if any]

X.1. [ ] Substep with file reference - File: `path/to/file.ex:line-numbers` - 📖
[Documentation](url) X.2. [ ] Write failing test - File: `test/path/to/test.exs`
X.3. [ ] Implement feature X.4. [ ] Run tests: `mix test path/to/test` X.5. [ ]
Verify all tests pass

📝 Commit: `type(scope): description`
```

**Include for each task:**

- Specific file paths with line numbers
- Documentation links where helpful
- Test file locations
- Test command to run
- Suggested commit message

### Step 6: Integrate TDD Requirements

Every task follows Red-Green-Refactor:

1. **RED**: Write failing test (substep)
2. **GREEN**: Implement to pass test (substeps)
3. **REFACTOR**: Clean up if needed (substep)
4. **VERIFY**: Run full test suite (substep)
5. **COMMIT**: Only after tests pass

### Step 7: Define Quality Gates

**Task-level gates:**

- All task tests pass
- Code follows project patterns
- Ready for commit

**Phase-level gates:**

- Integration between tasks works
- Phase success criteria met

**System-level gates:**

- Full test suite passes
- All acceptance criteria met

### Step 8: Create Breakdown Document

Write to `./notes/breakdowns/[feature-name].md`

### Step 9: Update Knowledge Base

Document in `./notes/knowledge/`:

- Task decomposition patterns used
- Testing strategies that worked
- Useful breakdown techniques

---

## Agent Consultations

| Agent              | When to Use                         |
| ------------------ | ----------------------------------- |
| architecture-agent | Task placement, module organization |
| qa-reviewer        | Test coverage, validation strategy  |
| research-agent     | Technical details from research     |

---

## Output

**Location**: `./notes/breakdowns/[feature-name].md`

**Document structure:**

```markdown
# [Feature] Implementation Breakdown

**Date**: YYYY-MM-DD **Status**: Ready for Execution **Plan**:
./notes/plans/[feature-name].md

## Overview

[Brief description]

## Tasks

### Phase 1: [Phase Name]

1. [ ] **Task Name** ...

### Phase 2: [Phase Name]

2. [ ] **Task Name** ...

## Testing Strategy

- TDD workflow for each task
- Quality gates between phases

## Success Criteria

- [ ] All tests pass
- [ ] Acceptance criteria met
```

---

## Critical Rules

🚨 **Do:**

- Include test substeps in EVERY task
- Provide specific file paths with line numbers
- Include commit message for each task
- Size tasks appropriately (15 min - 4 hours)
- Reference documentation links

🚨 **Don't:**

- Create tasks without testing substeps
- Use vague file references ("update the config")
- Skip commit guidance
- Create XL tasks (split them)

---

## Example

**Input:** `/breakdown user-authentication`

**Output excerpt:**

```markdown
### Phase 1: User Resource

1. [ ] **Add User Resource with Auth Attributes**

   1.1. [ ] Create user resource - File: `lib/app/accounts/user.ex` - Follow
   pattern: `lib/app/accounts/organization.ex:15-40` - 📖
   [Ash Resource Guide](https://hexdocs.pm/ash/resources.html) 1.2. [ ] Write
   user creation test - File: `test/app/accounts/user_test.exs` 1.3. [ ] Add
   email and password attributes 1.4. [ ] Add email validation 1.5. [ ] Run
   tests: `mix test test/app/accounts/user_test.exs` 1.6. [ ] Verify all tests
   pass

   📝 Commit: `feat(accounts): add user resource with auth attributes`

### Phase 2: OAuth Integration

2. [ ] **Configure OAuth Providers**

   Prerequisites: Task 1 complete

   2.1. [ ] Add ueberauth dependencies to mix.exs - 📖
   [Ueberauth Docs](https://hexdocs.pm/ueberauth) 2.2. [ ] Write OAuth callback
   test 2.3. [ ] Create OAuth controller - File:
   `lib/app_web/controllers/auth_controller.ex` 2.4. [ ] Configure providers in
   config/ 2.5. [ ] Run tests:
   `mix test test/app_web/controllers/auth_controller_test.exs` 2.6. [ ] Verify
   all tests pass

   📝 Commit: `feat(auth): configure OAuth providers`
```

---

## Common Pitfalls

- **Missing tests**: Every task MUST have test substeps
- **Vague references**: "Update config" → specify exact file and line
- **Giant tasks**: If >4 hours, split into smaller tasks
- **No dependencies noted**: Mark prerequisites between tasks
- **Skipping commit messages**: Include for every task

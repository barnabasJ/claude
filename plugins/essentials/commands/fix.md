---
description: Bug fixing with root cause analysis and regression testing
argument-hint: [issue-description]
---

# Fix Command

## Overview

Systematically diagnoses root causes, implements fixes, and creates regression
tests. Emphasizes finding the actual problem (not symptoms), knowledge-first
debugging, and ensuring the bug never returns.

---

## Prerequisites

- Clear description of the issue or bug
- Ability to reproduce the issue
- Access to run tests

---

## Workflow

### Step 1: Check Knowledge Base FIRST

🚨 **Before any debugging**, search `./notes/knowledge/`:

- `./notes/knowledge/hard-won-knowledge/` - Similar problems solved
- `./notes/knowledge/technical-patterns/` - Tech-specific solutions
- `./notes/knowledge/project/` - Project-specific approaches

Look for: similar errors, symptoms, previous solutions.

### Step 2: Create Fix Branch

```bash
git checkout -b fix/[issue-description]
```

### Step 3: Reproduce the Issue

Establish reliable reproduction:

- Document exact steps to trigger
- Identify minimum conditions required
- Verify reproduction is consistent

**Document:**

- Steps to reproduce
- Expected vs actual behavior
- Frequency (always/intermittent)

### Step 4: Investigate Root Cause

**Check logs and errors:**

- Stack traces
- Error messages
- Warning patterns

**Isolate the problem:**

- Which component fails?
- When did it start? (git bisect)
- What's different in failing vs passing cases?

**Five Whys technique:**

1. Why did error occur? → Function received null
2. Why null? → Database returned no results
3. Why no results? → WHERE clause too restrictive
4. Why too restrictive? → Wrong date format
5. Why wrong format? → No timezone handling

**Root cause**: Date parsing doesn't handle timezones

🚨 **Fix the root cause, not symptoms.**

### Step 5: Create Fix Plan Document

Write to `./notes/fixes/[issue-name].md`:

```markdown
# Fix: [Issue Name]

## Issue Description

- Problem: [what's broken]
- Steps to reproduce: [numbered steps]
- Expected: [what should happen]
- Actual: [what happens]

## Root Cause Analysis

- Where: [file:line]
- Why: [technical explanation]
- Affected: [related components]

## Solution

- Approach: [how to fix]
- Changes: [files to modify]

## Testing

- Regression test: [test that fails before, passes after]
- Edge cases: [additional tests]

## Rollback Plan

- Revert: [how to undo]
- Monitor: [what to watch]
```

### Step 6: Write Regression Test FIRST

🚨 **Before implementing fix:**

1. Write test that reproduces the bug
2. Verify test FAILS
3. This proves test catches the bug

### Step 7: Implement Fix

- Make minimal, targeted changes
- Address root cause (not symptoms)
- Follow project patterns

### Step 8: Verify Fix

1. Run regression test → should PASS now
2. Run full test suite → all should pass
3. Manually verify fix works

### Step 9: Run Reviews

Use review agents in parallel:

- qa-reviewer
- security-reviewer (if relevant)
- code-quality-reviewer

Address any issues found.

### Step 10: Commit and Document

```bash
git commit -m "fix(scope): description

Root cause: [brief explanation]
Solution: [what was changed]

Closes #[issue-number]"
```

### Step 11: Store Solution in Knowledge Base

🚨 **Immediately** after solving, document in
`./notes/knowledge/hard-won-knowledge/`:

```markdown
# [Problem Title]

## Symptoms

- Error message: [exact message]
- When it occurs: [conditions]

## Root Cause

[Technical explanation]

## Solution

[What fixed it]

## Prevention

[How to avoid in future]
```

---

## Agent Consultations

| Agent                    | When to Use                     |
| ------------------------ | ------------------------------- |
| qa-reviewer              | Test strategy, regression tests |
| security-reviewer        | Security implications           |
| senior-engineer-reviewer | Fix approach validation         |
| research-agent           | Technical documentation         |

---

## Output

**Location**: `./notes/fixes/[issue-name].md`

**Required sections:**

1. Issue Description
2. Root Cause Analysis
3. Solution
4. Testing Strategy
5. Rollback Plan

---

## Critical Rules

🚨 **Do:**

- Check knowledge base BEFORE debugging
- Find root cause, not symptoms
- Write regression test BEFORE implementing fix
- Store solution in knowledge base immediately
- Run review agents before completing

🚨 **Don't:**

- Fix symptoms while root cause remains
- Implement without regression test
- Skip knowledge base check
- Wait until later to document solution
- Delete tests to make fix "work"

---

## Example

**Input:** `/fix login-timeout-too-short`

**Process:**

```
1. Check knowledge base → No similar issue found

2. Reproduce:
   - Login, wait 35 seconds, submit
   - Get timeout error
   - Expected: 5 min timeout

3. Investigate:
   - Check session config
   - Found: timeout = 30000 (30 sec)
   - Should be: 300000 (5 min)
   - Root cause: Typo in config

4. Write regression test:
   - Test session timeout is 5 minutes
   - Verify test FAILS with current config

5. Fix:
   - Update config/session.conf: 30000 → 300000

6. Verify:
   - Regression test PASSES
   - Full suite passes

7. Commit:
   "fix(session): correct timeout from 30s to 5min"

8. Store in knowledge base:
   - Problem: Session timeout too short
   - Cause: Config typo (missing zero)
   - Solution: Verify timeout values have correct zeros
```

---

## Common Pitfalls

- **Fixing symptoms**: Null check instead of fixing why null occurs
- **Skipping regression test**: Bug can return undetected
- **Not checking knowledge base**: May repeat previous debugging work
- **Workarounds**: Always fix root cause, never work around it
- **Late documentation**: Document solution immediately while fresh

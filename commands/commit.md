---
description: Create conventional git commits with proper formatting
---

# Commit Command

## Overview

Creates well-formed git commits using conventional commit format. Analyzes
changes, determines commit type, and creates properly formatted messages.

---

## Prerequisites

- Changes exist in working directory (staged or unstaged)
- No merge conflicts pending
- Appropriate branch (feature/_, fix/_, etc.)

---

## Workflow

### Step 1: Analyze Current State

Run in parallel:

```bash
git status          # All changed files
git diff            # Unstaged changes
git diff --staged   # Staged changes
git log --oneline -10  # Recent commit style
```

### Step 2: Determine Commit Type

| Type     | When to Use                            |
| -------- | -------------------------------------- |
| feat     | New feature or capability              |
| fix      | Bug fix                                |
| refactor | Code restructuring, no behavior change |
| docs     | Documentation only                     |
| test     | Adding or updating tests               |
| chore    | Maintenance, dependencies, tooling     |
| style    | Formatting, whitespace                 |
| perf     | Performance improvements               |

### Step 3: Stage Files

```bash
git add <files>   # Specific files
git add -A        # All changes
```

🚨 **Never stage files with secrets** (.env, credentials.json, API keys)

### Step 4: Create Commit

Use HEREDOC format:

```bash
git commit -m "$(cat <<'EOF'
type(scope): brief description

Optional body explaining why this change was made.
EOF
)"
```

**Format:**

- Subject: `type(scope): description` (≤50 chars)
- Blank line
- Body: Explain "why" not "what" (optional)

### Step 5: Verify

```bash
git status   # Confirm clean state
git log -1   # Verify commit
```

---

## Critical Rules

🚨 **Never:**

- `git push` without explicit user request
- `--force`, `--hard`, or destructive flags
- `--no-verify` (skip hooks)
- Commit secrets or credentials
- `--amend` on commits you didn't author
- Reference Claude/AI in commit messages

🚨 **Always:**

- Use conventional commit format
- Check authorship before amend: `git log -1 --format='%an %ae'`
- Warn if staging sensitive files
- Use HEREDOC for message formatting
- Verify with `git status` after commit

---

## Error Handling

**Pre-commit hook modifies files:**

1. Review changes
2. `git add <modified-files>`
3. Retry commit (amend if your commit)

**Nothing to commit:**

- Check `git status` for changes
- Verify correct files staged

**Merge conflicts:**

- Cannot proceed until resolved
- Inform user

---

## Example

**Input:** `/commit`

**Process:**

```
1. git status → 2 files changed
2. git diff → auth.ex, auth_test.exs modified
3. git log → repo uses conventional commits
4. Type: feat (new validation feature)
5. Scope: auth
6. Stage: git add lib/auth.ex test/auth_test.exs
7. Commit:
   git commit -m "$(cat <<'EOF'
   feat(auth): add email validation to login

   Add regex-based email format validation to prevent
   invalid submissions. Includes edge case handling.
   EOF
   )"
8. Verify: git status, git log -1
```

---

## Commit Message Examples

```
feat(api): add user profile endpoint

Implement GET /api/users/:id/profile with auth
and caching for performance.
```

```
fix(payment): resolve timeout in processing

Add retry logic for high-load scenarios.

Fixes #456
```

```
refactor(auth): extract validation to utility

Move validation logic to shared module.
No behavior changes.
```

---

## Common Pitfalls

- **Mixing changes**: Keep commits focused on one thing
- **Vague messages**: "Fix bug" → "Fix null pointer in user validation"
- **Past tense**: Use "Add feature" not "Added feature"
- **Giant commits**: Small, focused commits are better

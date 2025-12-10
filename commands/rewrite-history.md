---
description:
  Reimplement current branch with clean, narrative-quality commit history
---

# Rewrite History Command

## Overview

Reimplements the current branch with a clean, reviewer-friendly commit history.
Creates a backup of the original branch, then rewrites commits as a logical
narrative suitable for code review.

---

## Prerequisites

- Current branch has changes relative to `main`
- No uncommitted changes or merge conflicts
- Branch is up to date with `main`

---

## Workflow

### Step 1: Validate Source Branch

Run validation checks:

```bash
git status                    # No uncommitted changes
git diff main --stat          # Confirm changes exist
git merge-base --is-ancestor main HEAD  # Up to date with main
```

🚨 **Stop if:**

- Uncommitted changes exist
- Merge conflicts pending
- No changes relative to main

### Step 2: Create Backup Branch

```bash
# Save current branch name
BRANCH=$(git branch --show-current)

# Create backup
git branch ${BRANCH}-backup
```

### Step 3: Analyze the Diff

Study all changes between current branch and `main`:

```bash
git diff main --stat          # Files changed
git diff main                 # Full diff
git log main..HEAD --oneline  # Existing commits
```

**Goal:** Form a complete understanding of the final intended state.

### Step 4: Plan the Commit Storyline

Break the implementation into logical stages:

1. **Foundation** - Setup, configuration, dependencies
2. **Core** - Main functionality implementation
3. **Integration** - Connecting components
4. **Polish** - Documentation, cleanup, refinements

Each commit should:

- Introduce a single coherent idea
- Be self-contained and buildable (when possible)
- Read like a tutorial step

**Write the plan before executing.**

### Step 5: Reset and Reimplement

```bash
# Reset to main, keeping changes in working directory
git reset main
```

Then recreate commits according to your plan:

```bash
git add <relevant-files>
git commit -m "$(cat <<'EOF'
type(scope): brief description

Explanation of what this step accomplishes and why.
EOF
)"
```

Repeat for each planned commit.

### Step 6: Verify Correctness

Confirm final state matches the backup:

```bash
git diff ${BRANCH}-backup
```

🚨 **This must show no differences.** If it does, investigate and fix.

### Step 7: Report Results

Show the new commit history:

```bash
git log main..HEAD --oneline
```

Inform user of:

- Backup branch name
- Number of new commits
- Summary of narrative structure

---

## Critical Rules

🚨 **Never:**

- Delete the backup branch
- Add yourself as author or contributor
- Include AI/Claude references in commits
- Use `--force` on shared branches
- Change the final state (must match original exactly)

🚨 **Always:**

- Create backup before any destructive operations
- Verify final state matches backup
- Use conventional commit format
- Write clear commit messages explaining "why"
- Use `--no-verify` sparingly (only for known issues)

---

## Commit Message Format

```
type(scope): brief description (≤50 chars)

Longer explanation of what this commit does and why.
Focus on the narrative - what problem does this solve?
What decision was made and why?
```

**Good narrative commits:**

```
feat(plugin): add plugin manifest structure

Create .claude-plugin/plugin.json with required metadata.
This establishes the plugin identity for Claude Code's
plugin system.
```

```
refactor(commands): standardize frontmatter format

Ensure all command files have description field in
frontmatter as required by plugin specification.
```

---

## Example

**Input:** `/rewrite-history`

**Process:**

```
1. Validate: git status clean, changes exist vs main
2. Backup: git branch feature/auth-backup
3. Analyze: 5 files changed, 3 original commits
4. Plan storyline:
   - feat: add user model
   - feat: implement auth service
   - feat: add login endpoint
   - test: add auth test suite
   - docs: update API documentation
5. Reset: git reset main
6. Reimplement: Create 5 clean commits
7. Verify: git diff feature/auth-backup (empty)
8. Report: "Created 5 commits, backup at feature/auth-backup"
```

---

## Common Pitfalls

- **Forgetting backup**: Always create backup first
- **Changing final state**: Diff must be empty vs backup
- **Too granular**: Commits should be meaningful, not trivial
- **Too large**: Each commit should be reviewable in isolation
- **Missing context**: Commit messages should explain decisions

---
description: Full workflow - Research, Plan, Breakdown, Execute in sequence
argument-hint: [feature-name]
---

# RPBE Command

## Overview

Orchestrates the complete four-phase workflow: Research → Plan → Breakdown →
Execute. Runs each phase sequentially with user checkpoints between phases. Use
for comprehensive feature implementation from analysis through delivery.

---

## Prerequisites

- Clear feature or task description
- Time for full workflow (30-60+ minutes for complex features)
- Ability to answer clarifying questions between phases

---

## Workflow

### Step 1: Create Master Task List

Use TodoWrite:

```json
[
  { "content": "Research phase", "status": "pending" },
  {
    "content": "Review research and gather clarifications",
    "status": "pending"
  },
  { "content": "Plan phase", "status": "pending" },
  { "content": "Review plan and gather clarifications", "status": "pending" },
  { "content": "Breakdown phase", "status": "pending" },
  { "content": "Review breakdown and get approval", "status": "pending" },
  { "content": "Execute phase", "status": "pending" },
  { "content": "Update knowledge base", "status": "pending" }
]
```

### Step 2: Research Phase

Run `/research [feature-name]`

**Output**: `./notes/research/[feature-name].md`

### Step 3: Research Checkpoint

After research completes:

1. Read research document
2. Identify ambiguities or questions
3. Use AskUserQuestion for clarifications
4. Update research document with answers
5. Confirm ready for planning

**Questions to consider:**

- Technology choices if multiple options
- Integration point preferences
- Existing pattern confirmations

### Step 4: Plan Phase

Run `/plan [feature-name]`

**Output**: `./notes/plans/[feature-name].md`

### Step 5: Plan Checkpoint

After plan completes:

1. Read plan document
2. Validate architectural decisions
3. Use AskUserQuestion for design alternatives
4. Update plan with user decisions
5. Confirm ready for breakdown

**Questions to consider:**

- Architectural approach approval
- Phase ordering preferences
- Priority tradeoffs

### Step 6: Breakdown Phase

Run `/breakdown [feature-name]`

**Output**: `./notes/breakdowns/[feature-name].md`

### Step 7: Breakdown Checkpoint (APPROVAL REQUIRED)

🚨 **Must get explicit user approval before execution**

Present summary:

- Number of tasks
- Estimated complexity
- Key phases
- Testing approach

Ask:

- "Does this breakdown look correct?"
- "Any tasks to add, remove, or split?"
- "Ready to proceed with execution?"

**Do NOT proceed to execute without approval.**

### Step 8: Execute Phase

Run `/execute [feature-name]`

Follows breakdown checklist with TDD workflow.

### Step 9: Update Knowledge Base

Document learnings in `./notes/knowledge/`:

- Workflow effectiveness
- Phase handoff quality
- Patterns discovered
- Techniques that worked

---

## Phase Handoffs

| From      | To        | Handoff Document               |
| --------- | --------- | ------------------------------ |
| Research  | Plan      | `./notes/research/[name].md`   |
| Plan      | Breakdown | `./notes/plans/[name].md`      |
| Breakdown | Execute   | `./notes/breakdowns/[name].md` |

Each phase reads the previous phase's output document.

---

## Critical Rules

🚨 **Do:**

- Run phases SEQUENTIALLY (never parallel)
- Checkpoint with user between each phase
- Get explicit approval before execute phase
- Update knowledge base at end

🚨 **Don't:**

- Skip checkpoints
- Start execute without breakdown approval
- Run phases in parallel
- Proceed if user has unanswered questions

---

## When to Use RPBE vs Individual Commands

**Use RPBE:**

- New feature requiring full analysis
- Complex implementation
- Time available for complete workflow
- Want structured checkpoints

**Use individual commands:**

- Only need one phase (e.g., just research)
- Resuming work after pause
- Simple task not needing full workflow
- Want to pause between phases for extended time

---

## Example

**Input:** `/rpbe user-authentication`

**Process:**

```
1. Create TodoWrite with 8 tasks

2. Research Phase:
   - Analyze codebase for auth patterns
   - Find existing user handling
   - Document dependencies
   Output: ./notes/research/user-authentication.md

3. Research Checkpoint:
   - "Research shows Guardian and Pow available. Which do you prefer?"
   - User: "Guardian"
   - Update research with decision

4. Plan Phase:
   - Design using Guardian
   - Define phases: User resource → OAuth → Sessions
   Output: ./notes/plans/user-authentication.md

5. Plan Checkpoint:
   - "Plan has 3 phases. OAuth before sessions ok?"
   - User: "Yes"

6. Breakdown Phase:
   - Create numbered task checklist
   - Add TDD requirements
   Output: ./notes/breakdowns/user-authentication.md

7. Breakdown Checkpoint:
   - "8 tasks total. Ready to execute?"
   - User: "Yes, proceed"

8. Execute Phase:
   - Implement tasks 1-8
   - Follow TDD workflow
   - Commit after each task

9. Update knowledge base with learnings
```

---

## Common Pitfalls

- **Skipping checkpoints**: Always pause for user input between phases
- **Parallel execution**: Phases must run sequentially
- **No breakdown approval**: Never execute without explicit approval
- **Rushing through**: Take time for quality at each phase

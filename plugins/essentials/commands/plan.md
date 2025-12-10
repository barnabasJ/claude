---
description: Strategic implementation planning from research findings
argument-hint: [feature-name]
---

# Plan Command

## Overview

Transforms research findings into a strategic implementation plan. Defines
architecture, phases, integration patterns, and success criteria. Creates the
blueprint that the breakdown phase will decompose into tasks.

Part of the four-phase workflow: research → plan → breakdown → execute

---

## Prerequisites

- Research phase completed with document at `./notes/research/[feature-name].md`
- Research includes file impact mapping, patterns, and dependencies

---

## Workflow

### Step 1: Check Knowledge Base

Search `./notes/knowledge/` for similar plans:

- Similar implementation plans
- Architectural decisions for related features
- Implementation patterns that worked well

### Step 2: Create Task List

Use TodoWrite with tasks:

- Check knowledge base
- Review research findings
- Consult architecture-agent
- Design implementation strategy
- Define phases and success criteria
- Create plan document
- Update knowledge base

### Step 3: Review Research Findings

Read `./notes/research/[feature-name].md` and extract:

- Files and modules affected
- Existing patterns to follow
- Dependencies and integration points
- Third-party services involved
- Questions that need user clarification

### Step 4: Consult Architecture Agent

Use architecture-agent to validate:

- Proposed structural approach
- Integration patterns
- Module organization
- Code placement decisions

### Step 5: Design Implementation Strategy

Based on research and architecture consultation:

**Define feature specification:**

- User stories with acceptance criteria
- API contracts and data flow
- State management approach
- Error handling strategy

**Design using existing patterns:**

- Reference specific files as templates (e.g., `lib/app/accounts/user.ex:45-67`)
- Extend existing modules following project conventions
- Plan data model changes using current schema patterns

### Step 6: Define Implementation Phases

Break implementation into phases:

**Each phase includes:**

- Clear objectives
- Success criteria
- Dependencies on other phases
- Deliverables

**Phase structure example:**

1. Infrastructure/Foundation
2. Core functionality
3. Integration
4. Testing and validation

### Step 7: Create Plan Document

Write to `./notes/plans/[feature-name].md`

### Step 8: Update Knowledge Base

Document in `./notes/knowledge/`:

- Architectural decisions made
- Patterns selected and why
- Planning techniques that worked

---

## Agent Consultations

| Agent                    | When to Use                                 |
| ------------------------ | ------------------------------------------- |
| architecture-agent       | Structural validation, integration approach |
| senior-engineer-reviewer | Strategic validation, scalability review    |
| research-agent           | Retrieve research details when needed       |

**Consultation patterns:**

- **Algorithm changes**: Run architecture-agent + senior-engineer-reviewer in
  PARALLEL
- **Cross-codebase changes**: Run SEQUENTIALLY (architecture first, then domain
  experts)

---

## Output

**Location**: `./notes/plans/[feature-name].md`

**Required sections:**

1. **Impact Analysis Summary** - Files affected, patterns to follow
2. **Feature Specification** - User stories, API contracts, data flow
3. **Technical Design** - Implementation approach with code references
4. **Implementation Strategy** - Phases with objectives and success criteria
5. **Agent Consultations** - Guidance received from agents
6. **Testing Strategy** - Test coverage requirements
7. **Success Criteria** - Measurable completion criteria

**Document metadata:**

```
type: plan
status: completed
created: YYYY-MM-DD
project: [project-name]
topic: [feature-name]
```

---

## Critical Rules

🚨 **Do:**

- Build on research findings (don't re-research)
- Reference specific files as pattern templates
- Include complete code examples in technical design
- Define clear phase boundaries and success criteria
- Validate architecture before finalizing

🚨 **Don't:**

- Create overly detailed low-level implementation plans (that's breakdown's job)
- Skip architecture consultation for complex changes
- Leave success criteria vague or unmeasurable
- Ignore existing patterns discovered in research

---

## Example

**Input:** `/plan user-authentication`

**Process:**

```
1. Check knowledge base → Found auth patterns in ./notes/knowledge/

2. Review research:
   - Research shows project uses Guardian for auth
   - Existing user.ex at lib/app/accounts/user.ex
   - OAuth patterns in lib/app_web/controllers/auth_controller.ex

3. Consult architecture-agent:
   - Recommended: Extend existing accounts context
   - Place OAuth logic in auth_controller.ex
   - Use existing Guardian pipeline

4. Design strategy:
   - Phase 1: User resource with auth attributes
   - Phase 2: OAuth integration
   - Phase 3: Session management
   - Phase 4: Testing

5. Define success criteria:
   - User can register/login with email
   - OAuth providers work (Google, GitHub)
   - Session persists across requests
   - All auth tests pass
```

**Output:** `./notes/plans/user-authentication.md`

---

## Common Pitfalls

- **Over-planning**: Keep phases high-level; details go in breakdown
- **Ignoring research**: Plan must build on research, not duplicate it
- **Vague criteria**: "Works correctly" is not a success criterion
- **Missing architecture review**: Always validate structure for complex changes
- **New patterns without justification**: Stick to existing patterns unless
  research identified issues

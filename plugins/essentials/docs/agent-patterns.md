# Agent Patterns

## Overview

The Essentials plugin includes 12 specialized agents that workflow commands
consult automatically. This document explains how agents work and when they're
used.

## Included Agents

### Research & Planning Agents

#### research-agent

**Purpose**: Technical documentation and codebase research

**Used by**: `/research` command

**Capabilities**:

- Searches codebase for patterns and implementations
- Analyzes dependencies and relationships
- Identifies similar existing code
- Documents findings for planning phase

#### architecture-agent

**Purpose**: System design and architectural analysis

**Used by**: `/plan` command

**Capabilities**:

- Validates architectural decisions
- Identifies integration points
- Suggests design patterns
- Reviews system-wide impact

#### feature-planner

**Purpose**: Feature planning and task breakdown

**Used by**: `/breakdown` command

**Capabilities**:

- Decomposes features into tasks
- Identifies dependencies between tasks
- Estimates complexity
- Defines acceptance criteria

### Code Review Agents

#### qa-reviewer

**Purpose**: Testing coverage analysis

**Used by**: `/execute` command

**Capabilities**:

- Validates test coverage
- Identifies untested code paths
- Reviews test quality
- Suggests additional test cases

#### security-reviewer

**Purpose**: Security vulnerability assessment

**Used by**: `/execute` command

**Capabilities**:

- Identifies security vulnerabilities
- Reviews authentication/authorization
- Checks for common security issues (OWASP)
- Validates input handling

#### code-quality-reviewer

**Purpose**: Language-agnostic code quality checks

**Used by**: `/execute` command

**Capabilities**:

- Reviews code structure and organization
- Identifies code smells
- Checks naming conventions
- Validates error handling

#### senior-engineer-reviewer

**Purpose**: Strategic technical review

**Used by**: `/execute` command

**Capabilities**:

- High-level architectural review
- Identifies technical debt
- Reviews design decisions
- Validates scalability concerns

### Validation Agents

#### consistency-reviewer

**Purpose**: Pattern and convention consistency

**Used by**: `/execute` command

**Capabilities**:

- Validates code follows existing patterns
- Checks naming conventions
- Reviews file organization
- Ensures consistency with codebase style

#### factual-reviewer

**Purpose**: Plan vs implementation verification

**Used by**: `/execute` command

**Capabilities**:

- Verifies implementation matches plan
- Checks all requirements addressed
- Validates acceptance criteria met
- Identifies scope drift

#### redundancy-reviewer

**Purpose**: Code duplication detection

**Used by**: `/execute` command

**Capabilities**:

- Identifies duplicate code
- Suggests refactoring opportunities
- Finds similar implementations
- Recommends code reuse

### Documentation Agents

#### documentation-expert

**Purpose**: Documentation creation

**Used by**: When documentation is needed

**Capabilities**:

- Creates documentation for new features
- Updates existing documentation
- Writes API documentation
- Creates usage examples

#### documentation-reviewer

**Purpose**: Documentation quality review

**Used by**: When documentation changes

**Capabilities**:

- Reviews documentation accuracy
- Checks completeness
- Validates examples work
- Ensures clarity

## Agent Consultation Patterns

### Sequential Consultation

Research → Architecture → Implementation

```
/research     → research-agent analyzes codebase
/plan         → architecture-agent validates design
/breakdown    → feature-planner creates tasks
/execute      → review agents validate quality
```

**Used when**: Complex features requiring multiple perspectives

### Parallel Review

Multiple review agents examine work simultaneously during `/execute`:

- qa-reviewer checks tests
- security-reviewer checks security
- code-quality-reviewer checks quality
- consistency-reviewer checks patterns

**Used when**: Comprehensive quality check needed

### Expert Guidance

Single agent consultation for specific needs:

- architecture-agent for design questions
- security-reviewer for security concerns
- documentation-expert for docs

**Used when**: Specific expertise needed

## How Commands Use Agents

### /research

1. Invokes research-agent
2. Agent searches codebase for patterns
3. Analyzes dependencies
4. Produces research document

### /plan

1. Reads research document
2. Invokes architecture-agent
3. Agent validates design decisions
4. Produces plan document

### /breakdown

1. Reads plan document
2. Invokes feature-planner
3. Agent decomposes into tasks
4. Produces breakdown document

### /execute

1. Reads breakdown document
2. Implements tasks with TDD
3. Invokes review agents:
   - qa-reviewer for test coverage
   - security-reviewer for vulnerabilities
   - code-quality-reviewer for quality
   - consistency-reviewer for patterns
   - factual-reviewer for plan compliance
4. Addresses all findings
5. Produces working code

### /fix

1. Invokes research-agent for diagnosis
2. Identifies root cause
3. Creates regression test
4. Implements fix
5. Review agents validate

## Agent Output Format

Agents return structured findings that commands use:

```
## Findings

### Critical
- Issue description
- Location: file:line
- Recommendation

### Warnings
- Issue description
- Location: file:line
- Recommendation

### Suggestions
- Improvement description
- Location: file:line
- Recommendation
```

## Best Practices

### 1. Trust Agent Findings

Agents catch issues humans miss:

- Don't dismiss findings without consideration
- Address all critical issues before completion
- Document reasons if you disagree

### 2. Use Appropriate Agents

Commands invoke the right agents automatically:

- Research phase: research-agent
- Planning phase: architecture-agent
- Execution phase: review agents

### 3. Review Agent Output

Agents provide actionable feedback:

- Read all findings carefully
- Prioritize critical issues
- Consider warnings seriously
- Implement sensible suggestions

### 4. Iterate Based on Feedback

Agent feedback improves quality:

- Address findings before proceeding
- Re-run agents after changes
- Use findings to improve process

## Summary

The 12 agents provide specialized expertise:

| Agent                    | Purpose                | Used By    |
| ------------------------ | ---------------------- | ---------- |
| research-agent           | Codebase analysis      | /research  |
| architecture-agent       | Design validation      | /plan      |
| feature-planner          | Task decomposition     | /breakdown |
| qa-reviewer              | Test coverage          | /execute   |
| security-reviewer        | Security assessment    | /execute   |
| code-quality-reviewer    | Code quality           | /execute   |
| senior-engineer-reviewer | Strategic review       | /execute   |
| consistency-reviewer     | Pattern consistency    | /execute   |
| factual-reviewer         | Plan compliance        | /execute   |
| redundancy-reviewer      | Duplication detection  | /execute   |
| documentation-expert     | Documentation creation | As needed  |
| documentation-reviewer   | Documentation review   | As needed  |

Agents are consulted automatically by commands - no manual invocation needed.

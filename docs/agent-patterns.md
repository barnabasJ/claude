# Agent Consultation Patterns

## Overview

The workflow commands reference various agent consultation patterns. While this
plugin doesn't include specific agent implementations, understanding these
patterns helps you know when to seek specialized guidance.

## Agent Pattern Categories

### 1. Research Agents

**Purpose**: Deep investigation and analysis

**When commands mention research agents:**

- Performing thorough codebase investigation
- Analyzing third-party libraries or APIs
- Understanding unfamiliar technologies
- Evaluating multiple implementation approaches

**What this means for you:**

- Take time for thorough research
- Use web search for unfamiliar concepts
- Read documentation carefully
- Compare multiple approaches before deciding

### 2. Architecture Agents

**Purpose**: System design and integration decisions

**When commands mention architecture agents:**

- Making structural decisions
- Designing component boundaries
- Planning module organization
- Considering integration patterns

**What this means for you:**

- Think about system-wide impact
- Consider maintainability and scalability
- Follow established architectural patterns
- Document design decisions

### 3. Domain Expert Agents

**Purpose**: Technology-specific best practices

**When commands mention domain experts (e.g., database expert, security
expert):**

- Following technology-specific best practices
- Applying specialized knowledge
- Avoiding common pitfalls
- Implementing security or performance patterns

**What this means for you:**

- Research best practices for the technology
- Consider security implications
- Think about performance
- Follow framework conventions

### 4. Review Agents

**Purpose**: Quality assurance and validation

**When commands mention reviewers:**

- Code quality validation
- Security review
- Test coverage verification
- Consistency checking

**What this means for you:**

- Self-review your work carefully
- Run linters and formatters
- Ensure comprehensive test coverage
- Check for security vulnerabilities

## Consulting Agent Patterns

### Pattern 1: Sequential Consultation

Research → Architecture → Implementation

**Used when:**

- Complex features requiring multiple perspectives
- Need to understand before designing
- Design must inform implementation

**How to apply:**

1. Complete thorough research first
2. Use research to inform architectural decisions
3. Implement following the designed architecture

### Pattern 2: Parallel Review

Multiple reviewers examine work simultaneously

**Used when:**

- Comprehensive quality check needed
- Multiple quality dimensions (security, performance, etc.)
- Final validation before completion

**How to apply:**

1. Complete implementation
2. Check multiple quality dimensions:
   - Functionality (does it work?)
   - Security (is it safe?)
   - Performance (is it efficient?)
   - Tests (is it covered?)
   - Consistency (does it match the codebase?)

### Pattern 3: Expert Guidance

Consult specialist before proceeding

**Used when:**

- Unfamiliar technology or domain
- High-risk decisions
- Need specialized knowledge

**How to apply:**

1. Identify knowledge gaps
2. Research the topic thoroughly
3. Seek expert guidance (documentation, articles, etc.)
4. Apply learnings to your work

## Replacing Agent Consultations

Since this plugin doesn't include actual agent implementations, here's how to
handle agent consultation references:

### When a Command Says: "Consult research-agent"

**Do this instead:**

1. Perform thorough research yourself using:

   - Glob/Grep to find similar code
   - Read existing implementations
   - Web search for best practices
   - Read relevant documentation

2. Document your findings
3. Make informed decisions based on research

### When a Command Says: "Consult architecture-agent"

**Do this instead:**

1. Think about system design:

   - How does this fit into existing architecture?
   - What patterns does the codebase use?
   - What are the integration points?

2. Sketch out the design
3. Validate against existing patterns

### When a Command Says: "Run review agents"

**Do this instead:**

1. Self-review your work:

   - **Functional**: Does it work as expected?
   - **Tests**: Are tests comprehensive?
   - **Security**: Any vulnerabilities?
   - **Performance**: Any bottlenecks?
   - **Consistency**: Matches codebase style?

2. Run automated tools:
   - Linters
   - Formatters
   - Security scanners
   - Test coverage tools

## Agent Collaboration Patterns

### Research → Plan Handoff

**Research agent provides:**

- Existing patterns found
- Dependencies mapped
- Complexity assessment

**Planning uses this to:**

- Design consistent approach
- Plan for dependencies
- Estimate effort

**You should:**

- Ensure research document is complete
- Reference research in planning
- Base decisions on research findings

### Plan → Breakdown Handoff

**Planning provides:**

- Implementation strategy
- Phases defined
- Risks identified

**Breakdown uses this to:**

- Create granular tasks
- Specify test requirements
- Order tasks by dependencies

**You should:**

- Break each plan phase into tasks
- Include test requirements for each task
- Consider risks when ordering tasks

### Breakdown → Execute Handoff

**Breakdown provides:**

- Numbered, granular tasks
- Test requirements per task
- Dependencies mapped

**Execute uses this to:**

- Follow tasks in order
- Write tests first
- Validate completion

**You should:**

- Follow tasks sequentially
- Complete each task fully before moving to next
- Validate all acceptance criteria

## Quality Gates

### Research Phase Gate

**Questions to answer:**

- Have I found all similar implementations?
- Are all dependencies documented?
- Do I understand the existing patterns?
- Have I assessed complexity accurately?

**Don't proceed to planning until:**

- Research document is complete
- Similar implementations analyzed
- Dependencies fully mapped

### Planning Phase Gate

**Questions to answer:**

- Is the implementation strategy clear?
- Are phases logical and ordered?
- Have I identified all risks?
- Are success criteria measurable?

**Don't proceed to breakdown until:**

- Plan is comprehensive
- Risks are identified and mitigated
- Strategy is approved (if needed)

### Breakdown Phase Gate

**Questions to answer:**

- Is every task granular and actionable?
- Does every task have test requirements?
- Are dependencies correctly ordered?
- Are acceptance criteria clear?

**Don't proceed to execution until:**

- All tasks are well-defined
- Tests are specified for each task
- Task order makes sense

### Execution Phase Gate

**Questions to answer:**

- Are all tests passing?
- Have I followed test-driven development?
- Do changes match the breakdown?
- Have I validated all acceptance criteria?

**Don't mark complete until:**

- 100% test pass rate achieved
- All tasks completed
- No regressions introduced

## Customization

You can extend this plugin with actual agent implementations:

### Adding Real Agents

1. **Create agent definitions** in `agents/` directory
2. **Define agent capabilities** and tools
3. **Update commands** to use actual Task tool invocations
4. **Document agent APIs** for command integration

### Agent System Integration

If you have an existing agent system:

1. Map these agent patterns to your system
2. Update command definitions to invoke your agents
3. Maintain the same workflow principles
4. Keep quality gates consistent

## Best Practices

1. **Think like an agent**: Even without actual agents, adopt their mindset
2. **Multiple perspectives**: Check your work from different angles
3. **Specialized knowledge**: Research domain-specific best practices
4. **Quality first**: Never skip quality checks for speed
5. **Document decisions**: Record your reasoning for future reference

## Summary

Agent consultation patterns in these workflows represent:

- **Different perspectives** to apply to your work
- **Quality checks** to perform
- **Knowledge domains** to consider
- **Validation gates** before proceeding

Apply these patterns through thorough research, multiple review passes, and
systematic validation at each phase.

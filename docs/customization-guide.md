# Customization Guide

## Overview

The Claude Workflow Plugin is designed to be customized for your specific
project needs. This guide shows you how to adapt it to your workflow.

## Directory Structure Customization

### Changing Output Locations

By default, commands create documentation in:

- `./docs/research/[feature].md`
- `./docs/plans/[feature].md`
- `./docs/breakdowns/[feature].md`

To change these locations, edit the command files in `commands/`:

**Example: Moving research to a different directory**

Edit `commands/research.md`, find:

```markdown
- Location: `./docs/research/`
- Output file: `./docs/research/[feature-name].md`
```

Change to:

```markdown
- Location: `./research/`
- Output file: `./research/[feature-name].md`
```

### Creating Custom Directory Structures

Adapt to your project's conventions:

**Monorepo structure:**

```
./apps/[app-name]/docs/research/[feature].md
./apps/[app-name]/docs/plans/[feature].md
```

**Feature-based structure:**

```
./features/[feature]/research.md
./features/[feature]/plan.md
./features/[feature]/breakdown.md
```

## Command Customization

### Modifying Existing Commands

Each command file in `commands/` can be customized:

#### 1. Adjust Workflow Steps

**Example: Adding a security review step to the plan command**

Edit `commands/plan.md`, add a new step:

```markdown
### Step 5: Security Review

Review the plan for security implications:

1. **Authentication/Authorization**: How is access controlled?
2. **Data Validation**: What inputs need validation?
3. **Sensitive Data**: How is sensitive data protected?
```

#### 2. Customize Output Templates

**Example: Adding a "Testing Considerations" section to research**

Edit `commands/research.md`, modify the template:

```markdown
## Testing Considerations

### Existing Test Patterns

- [Pattern 1]
- [Pattern 2]

### Test Data Available

- [Source 1]
- [Source 2]
```

#### 3. Change Success Criteria

**Example: Adding code coverage requirements to execute**

Edit `commands/execute.md`, update success criteria:

```markdown
✅ All tests passing (100% pass rate) ✅ Code coverage above 80% ✅ No linter
errors
```

### Creating New Commands

Create a new file in `commands/` directory:

**Example: Adding a `/document` command**

Create `commands/document.md`:

```markdown
# Document Command

## Overview

Generate comprehensive documentation for implemented features.

## When to Use

- Feature implementation is complete
- Documentation needs to be updated
- API changes need to be documented

## Command Syntax

`/document [feature-name]`

## Workflow Steps

### Step 1: Analyze Implementation

1. Read the executed code
2. Identify public APIs
3. Find configuration options
4. Note important behavior

### Step 2: Generate Documentation

Create documentation covering:

- Feature overview
- Installation/setup
- Usage examples
- API reference
- Configuration options

### Step 3: Update Existing Docs

- Update README if needed
- Add to CHANGELOG
- Update API documentation

## Success Criteria

✅ All public APIs documented ✅ Usage examples provided ✅ Configuration
documented ✅ README updated if needed
```

## Phase Template Customization

### Adjusting Phase Definitions

Each command defines phases differently. Customize for your domain:

**Example: Web API development phases**

Edit `commands/plan.md`, modify phases:

```markdown
### Phase 1: Data Models

- Database schema design
- Model definitions
- Migrations

### Phase 2: Business Logic

- Core functionality
- Validation rules
- Error handling

### Phase 3: API Endpoints

- Route definitions
- Controller implementation
- Request/response handling

### Phase 4: Integration & Documentation

- Integration tests
- API documentation
- Deployment preparation
```

**Example: Frontend component development phases**

```markdown
### Phase 1: Component Structure

- Component skeleton
- Props interface
- Basic rendering

### Phase 2: Styling & Layout

- CSS/styling implementation
- Responsive design
- Accessibility

### Phase 3: Behavior & State

- Event handlers
- State management
- Side effects

### Phase 4: Testing & Polish

- Component tests
- Integration tests
- Performance optimization
```

## Test Strategy Customization

### Adjusting Test Requirements

Edit commands to match your test requirements:

**Example: Adding E2E tests to breakdown**

Edit `commands/breakdown.md`, update task format:

```markdown
#### Test Requirements

- [ ] Unit test: [behavior]
- [ ] Integration test: [interaction]
- [ ] E2E test: [user flow]
```

**Example: Specifying test coverage**

```markdown
#### Test Requirements

- [ ] Test covers happy path
- [ ] Test covers error cases
- [ ] Test covers edge cases
- [ ] Coverage > 90% for this module
```

### Technology-Specific Testing

Customize for your stack:

**Example: React component testing**

```markdown
#### Test Requirements

- [ ] Render test with React Testing Library
- [ ] Props validation test
- [ ] Event handler test
- [ ] State change test
- [ ] Snapshot test
```

**Example: API endpoint testing**

```markdown
#### Test Requirements

- [ ] Success case (200 OK)
- [ ] Validation errors (400 Bad Request)
- [ ] Authentication failure (401 Unauthorized)
- [ ] Authorization failure (403 Forbidden)
- [ ] Not found (404)
```

## Quality Gate Customization

### Adding Project-Specific Gates

Edit `CLAUDE.md` to add custom quality gates:

```markdown
### Custom Quality Gates

Before completing any phase:

**Code Quality Gate:**

- [ ] Linter passes with no warnings
- [ ] No console.log statements
- [ ] No TODO comments without tickets

**Security Gate:**

- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] SQL injection prevented

**Performance Gate:**

- [ ] No N+1 queries
- [ ] Appropriate caching
- [ ] Bundle size within limits
```

## Tool Integration

### Adding CI/CD Integration

**Example: Adding GitHub Actions workflow**

Create `.github/workflows/claude-workflow.yml`:

```yaml
name: Validate Workflow Documents

on:
  pull_request:
    paths:
      - "docs/breakdowns/**"
      - "docs/plans/**"

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Check breakdown format
        run: |
          # Validate breakdown documents have required sections
          ./scripts/validate-breakdown.sh
```

### Adding Issue Tracker Integration

**Example: Linking to Jira/Linear**

Edit commands to include issue references:

```markdown
## Task N: [Task Description]

**Issue**: [PROJ-123](https://your-tracker.com/PROJ-123) **Dependencies**: Task
N-1
```

## Team Customization

### Multi-Developer Workflows

Adapt for team collaboration:

**Example: Adding review checkpoints**

Edit `commands/execute.md`:

```markdown
### After Each Phase

1. Create PR with phase deliverables
2. Request review from team lead
3. Address feedback
4. Merge and proceed to next phase
```

**Example: Adding pair programming guidance**

```markdown
### Execution Strategy

**For complex tasks:**

- Pair programming session
- Driver: Writes code
- Navigator: Reviews and guides

**For straightforward tasks:**

- Solo implementation
- PR review before merge
```

### Role-Based Customization

Different roles may use workflows differently:

**Example: Backend vs Frontend split**

Create role-specific command variants:

- `commands/research-backend.md`
- `commands/research-frontend.md`

## Language/Framework Customization

### Framework-Specific Patterns

**Example: Ruby on Rails**

Edit commands to reference Rails conventions:

```markdown
### Affected Files

#### Models

- `app/models/[model].rb`
- `db/migrate/[timestamp]_[migration].rb`

#### Controllers

- `app/controllers/[controller]_controller.rb`

#### Views

- `app/views/[controller]/[action].html.erb`

#### Tests

- `test/models/[model]_test.rb`
- `test/controllers/[controller]_controller_test.rb`
```

**Example: Django**

```markdown
### Affected Files

#### Models

- `[app]/models.py`
- `[app]/migrations/[number]_[name].py`

#### Views

- `[app]/views.py` or `[app]/views/[view].py`

#### Templates

- `[app]/templates/[app]/[template].html`

#### Tests

- `[app]/tests/test_models.py`
- `[app]/tests/test_views.py`
```

## Documentation Standards

### Adding Organization Guidelines

Edit `CLAUDE.md` to include your standards:

```markdown
## Documentation Standards

### Code Comments

- JSDoc for all public functions
- Inline comments for complex logic only
- No commented-out code

### Commit Messages

- Follow Conventional Commits
- Reference issue numbers
- Include breaking change notes

### Documentation Files

- Markdown format
- Include code examples
- Keep up to date with changes
```

## Example: Complete Customization

Here's an example of customizing for a React + TypeScript + GraphQL project:

### 1. Update CLAUDE.md

```markdown
## Project-Specific Guidelines

### Technology Stack

- React 18 with TypeScript
- GraphQL with Apollo Client
- Jest + React Testing Library
- Styled Components

### File Structure

- Components: `src/components/[Feature]/[Component].tsx`
- Tests: `src/components/[Feature]/__tests__/[Component].test.tsx`
- GraphQL: `src/graphql/[entity]/[query|mutation].ts`

### Quality Standards

- TypeScript strict mode
- 90% test coverage minimum
- No `any` types
- All GraphQL queries typed
```

### 2. Customize Research Command

Edit `commands/research.md`, add GraphQL section:

```markdown
### Step 4.5: Document GraphQL Schema

**Goal**: Understand GraphQL schema implications

1. **Identify schema changes needed**:

   - New types
   - New queries/mutations
   - Modified fields

2. **Check existing patterns**:
   - Resolver structure
   - Type generation setup
   - Query optimization patterns
```

### 3. Customize Plan Command

Edit `commands/plan.md`, adjust phases:

```markdown
### Phase 1: Type Definitions & Schema

- TypeScript interfaces
- GraphQL schema updates
- Type generation

### Phase 2: Components & UI

- Component implementation
- Styled components
- State management

### Phase 3: GraphQL Integration

- Query/mutation definitions
- Apollo Client hooks
- Cache updates

### Phase 4: Testing

- Component tests
- Integration tests with Mock Service Worker
- E2E tests with Cypress
```

## Tips for Customization

1. **Start small**: Customize one command at a time
2. **Test changes**: Try customizations on a real feature
3. **Document**: Update README with your customizations
4. **Share**: Commit customizations for team consistency
5. **Iterate**: Refine based on what works

## Summary

The plugin is fully customizable:

- **Commands**: Modify workflows and steps
- **Phases**: Adjust for your domain
- **Tests**: Match your testing strategy
- **Integration**: Connect to your tools
- **Standards**: Enforce your guidelines

Adapt it to your needs, and enjoy systematic development!

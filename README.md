# Claude Workflow Plugin

A structured four-phase workflow system for software development with Claude
Code.

## Overview

This plugin provides a systematic approach to software development through four
distinct phases:

1. **Research** - Understand the codebase, identify patterns, and map
   dependencies
2. **Plan** - Design comprehensive implementation strategies
3. **Breakdown** - Create detailed, testable task lists
4. **Execute** - Implement with quality checks

## Quick Start

### Installation

1. Clone or download this repository
2. Place the `claude-workflow-plugin` directory in your project
3. Claude Code will automatically detect the `CLAUDE.md` file and load the
   workflows

### Basic Usage

```bash
# Research a feature
/research add-user-authentication

# Plan the implementation
/plan add-user-authentication

# Break down into tasks
/breakdown add-user-authentication

# Execute the implementation
/execute add-user-authentication

# Run the full workflow in one go
/rpbe add-user-authentication
```

## Features

### Core Workflow Commands

- `/research` - Codebase impact analysis and dependency mapping
- `/plan` - Strategic implementation planning
- `/breakdown` - Task decomposition with TDD integration
- `/execute` - Systematic implementation with quality checks
- `/rpbe` - Full workflow orchestration (Research → Plan → Breakdown → Execute)

### Development Commands

- `/fix` - Bug fixing with root cause analysis
- `/commit` - Conventional commit message generation

## Documentation

- [Getting Started Guide](docs/getting-started.md) - Step-by-step introduction
- [Workflow Overview](docs/workflow-overview.md) - Detailed workflow explanation
- [Customization Guide](docs/customization-guide.md) - Adapting to your needs

## Philosophy

This workflow system is built on these principles:

1. **Research First** - Understand before acting
2. **Progressive Refinement** - Move from broad strategy to specific tasks
3. **Test-Driven** - Tests guide implementation
4. **Quality Gates** - Each phase validates the previous one
5. **Systematic Progress** - Track work through structured todos

## Requirements

- Claude Code CLI
- Git (for commit command)
- Your favorite development tools

## Project Structure

```
claude-workflow-plugin/
├── README.md              # This file
├── CLAUDE.md             # Entry point for Claude Code
├── commands/             # Workflow command definitions
│   ├── research.md
│   ├── plan.md
│   ├── breakdown.md
│   ├── execute.md
│   ├── rpbe.md
│   ├── fix.md
│   └── commit.md
└── docs/                 # Documentation
    ├── getting-started.md
    ├── workflow-overview.md
    └── customization-guide.md
```

## License

MIT License - Feel free to use and modify for your projects.

## Contributing

This is a template workflow system. Fork and adapt it to your specific needs!

## Credits

Based on practical experience with AI-assisted software development and
test-driven development methodologies.

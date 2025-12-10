# Essentials Plugin

Commands and agents for systematic software development with Claude Code.

## Installation

Add this repository as a plugin marketplace, then install:

```bash
# Add the marketplace (one-time setup)
/plugin marketplace add /path/to/this/directory

# Install the plugin
/plugin install essentials@local
```

Or install directly if you have a marketplace configured:

```bash
/plugin install essentials
```

## Commands

### Workflow Commands

- `/research [feature]` - Codebase impact analysis and dependency mapping
- `/plan [feature]` - Strategic implementation planning
- `/breakdown [feature]` - Task decomposition with TDD
- `/execute [feature]` - Systematic implementation
- `/rpbe [feature]` - Full workflow (Research → Plan → Breakdown → Execute)

### Development Commands

- `/fix [issue]` - Bug fixing with root cause analysis
- `/commit` - Conventional commit message generation

## Agents

Specialized agents available via the Task tool:

| Agent                      | Purpose                                                    |
| -------------------------- | ---------------------------------------------------------- |
| `research-agent`           | Documentation research and technical information gathering |
| `architecture-agent`       | Architectural analysis and design guidance                 |
| `feature-planner`          | Feature planning and task breakdown                        |
| `qa-reviewer`              | Testing coverage analysis                                  |
| `security-reviewer`        | Security vulnerability analysis                            |
| `code-quality-reviewer`    | Automated code quality checks                              |
| `consistency-reviewer`     | Pattern and convention consistency                         |
| `factual-reviewer`         | Plan vs implementation verification                        |
| `redundancy-reviewer`      | Code duplication detection                                 |
| `documentation-expert`     | Documentation creation                                     |
| `documentation-reviewer`   | Documentation quality review                               |
| `senior-engineer-reviewer` | Strategic technical review                                 |

## Documentation

- [Getting Started](docs/getting-started.md)
- [Workflow Overview](docs/workflow-overview.md)
- [Customization Guide](docs/customization-guide.md)

## Structure

```
essentials/
├── .claude-plugin/
│   └── plugin.json      # Plugin manifest
├── commands/            # Slash commands
├── agents/              # Specialized agents
└── docs/                # Documentation
```

# Essentials Marketplace

This repository is a Claude Code plugin marketplace containing the `essentials`
plugin.

## Repository Structure

```
.
├── .claude-plugin/
│   └── marketplace.json    # Marketplace manifest
└── plugins/
    └── essentials/         # The essentials plugin
        ├── .claude-plugin/
        │   └── plugin.json # Plugin manifest
        ├── commands/       # Slash commands
        ├── agents/         # Specialized agents
        └── docs/           # Documentation
```

## Development

### Validating Changes

Always validate manifests after changes:

```bash
# Validate marketplace
claude plugin validate .claude-plugin/marketplace.json

# Validate plugin
claude plugin validate plugins/essentials
```

### Testing Locally

```bash
# Add marketplace from local path
claude plugin marketplace add /path/to/this/repo

# Install plugin
claude plugin install essentials

# Uninstall when done testing
claude plugin uninstall essentials
claude plugin marketplace remove essentials-marketplace
```

### Adding New Commands

1. Create markdown file in `plugins/essentials/commands/`
2. Commands are auto-discovered from the `commands` path in plugin.json

### Adding New Agents

1. Create markdown file in `plugins/essentials/agents/`
2. Add the file path to the `agents` array in plugin.json
3. Re-validate the plugin

## Plugin Manifest Fields

Required in `plugin.json`:

- `name` - Plugin identifier (kebab-case)
- `commands` - Path to commands directory (trailing slash)
- `agents` - Array of agent file paths (must end in `.md`)

Optional:

- `description`, `version`, `author`, `license`, `keywords`

## Marketplace Manifest Fields

Required in `marketplace.json`:

- `name` - Marketplace identifier
- `plugins` - Array of plugin entries with `name` and `source`

Optional:

- `owner` - Marketplace owner info
- `metadata.description` - Marketplace description

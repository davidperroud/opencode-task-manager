# OpenCode Task Manager

A simple and effective task management system for OpenCode. Create, track, and execute tasks directly from your terminal using custom `/task` commands.

## Features

- **Quick task creation** - Add tasks with a single command
- **Priority levels** - Organize work by high, medium, and low priority
- **Status tracking** - Visual status indicators: `[ ]` TODO, `[~]` IN_PROGRESS, `[x]` DONE
- **Git integration** - Automatic commits for every task change
- **Markdown-based** - All tasks stored in a simple `TASKS.md` file

## Installation

### Option 1: Manual Installation

Copy the command files to your OpenCode global commands directory:

```bash
mkdir -p ~/.config/opencode/commands
cp task*.md ~/.config/opencode/commands/
```

### Option 2: Using the Install Script

```bash
curl -fsSL https://raw.githubusercontent.com/<your-username>/opencode-task-manager/main/install.sh | bash
```

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/task <desc>` | Create TASKS.md + add task | `/task Refactor auth system` |
| `/task-create` | Initialize empty TASKS.md | `/task-create` |
| `/task-add <desc>` | Add task to existing file | `/task-add Write tests` |
| `/task-execute [id]` | Execute tasks (all or by ID) | `/task-execute 2` |
| `/task-summary` | Show task summary | `/task-summary` |
| `/task-remove <id>` | Remove task by ID | `/task-remove 3` |
| `/task-help` | Show help | `/task-help` |

## Task Status Symbols

| Symbol | Status | Meaning |
|--------|--------|---------|
| `[ ]` | TODO | Task not started |
| `[~]` | IN_PROGRESS | Task being worked on |
| `[x]` | DONE | Task completed |

## Priority Levels

- **high** - Critical, do first
- **medium** - Important, do after high priority tasks
- **low** - Nice to have, do when possible

## TASKS.md Format

Tasks are stored in a simple markdown file at your project root:

```markdown
# Tasks

Created: 2026-05-19
Last updated: 2026-05-19

## Summary
- Total: 3
- TODO: 1
- IN_PROGRESS: 1
- DONE: 1

## Tasks

### 1. Refactor authentication system
- Status: [~] IN_PROGRESS
- Priority: high
- Created: 2026-05-19
- Description: Refactor authentication to use JWT tokens

### 2. Write unit tests
- Status: [ ] TODO
- Priority: medium
- Created: 2026-05-19
- Description: Add tests for Client and Project models

### 3. Update documentation
- Status: [x] DONE
- Priority: low
- Created: 2026-05-19
- Completed: 2026-05-19
- Description: Update README with new commands
```

## Usage Examples

### Creating your first task

```
/task Build user registration
```

This will:
1. Create `TASKS.md` if it doesn't exist
2. Ask for priority (high/medium/low)
3. Add the task with status `[ ]` TODO

### Adding more tasks

```
/task-add Implement password reset
```

### Executing tasks

```
/task-execute        # Execute all pending tasks in order
/task-execute 2      # Execute task #2 specifically
```

### Checking progress

```
/task-summary
```

## Requirements

- [OpenCode](https://opencode.ai) installed
- Git initialized in your project (for auto-commit feature)

## License

MIT License - see [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

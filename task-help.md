---
name: task-help
description: Display help and usage information for all /task commands
argument-hint: "(no arguments)"
permissions:
   read: false
   write: false
   bash: false
   question: false
---

<objective>
Display a comprehensive help guide for all /task commands with examples.
</objective>

<process>
Display the following help text:

```
╔══════════════════════════════════════════════╗
║          TASK MANAGEMENT COMMANDS            ║
╚══════════════════════════════════════════════╝

/task <description>
  Create TASKS.md if needed and add a new task.
  Asks for priority (high/medium/low).
  Example: /task Refactor authentication system

/task-create
  Initialize a new TASKS.md file in the project root.
  Creates empty structure with summary section.

/task-add <description>
  Add a new task to existing TASKS.md.
  Asks for priority (high/medium/low).
  Example: /task-add Write unit tests for Client model

/task-execute [id]
  Execute tasks from TASKS.md.
  Without ID: execute all TODO tasks in order.
  With ID: execute that specific task.
  Status flow: [ ] TODO → [~] IN_PROGRESS → [x] DONE
  Example: /task-execute        (execute all)
  Example: /task-execute 2      (execute task #2)

/task-summary
  Display a summary of all tasks and their statuses.
  Shows statistics, in-progress, pending, and completed tasks.

/task-remove <id>
  Remove a task from TASKS.md by ID.
  Requires confirmation before deletion.
  Example: /task-remove 3

/task-help
  Display this help message.

── Task Status Symbols ────────────────────────
[ ]  TODO          Task not started
[~]  IN_PROGRESS   Task being worked on
[x]  DONE          Task completed

── Priority Levels ────────────────────────────
high     Critical, do first
medium   Important, do after high
low      Nice to have, do when possible

── File Format ────────────────────────────────
Tasks are stored in TASKS.md at the project root.
Each modification is automatically committed to git.
```
</process>

---
name: task
description: Create or update TASKS.md and add a new task with priority
argument-hint: "<task description>"
permissions:
   read: true
   write: true
   bash: true
   question: true
---

<objective>
Create TASKS.md if it doesn't exist, then add a new task with the provided description and ask for priority.
</objective>

<process>
1. Check if TASKS.md exists in the current project root
2. If it doesn't exist, create it with the base structure:
   ```markdown
   # Tasks

   Created: <today's date>
   Last updated: <today's date>

   ## Summary
   - Total: 0
   - TODO: 0
   - IN_PROGRESS: 0
   - DONE: 0

   ## Tasks
   ```
3. Read TASKS.md and determine the next task ID (highest existing ID + 1)
4. Ask the user for priority: "What priority for this task?" with options: high, medium, low
5. Append the new task to the Tasks section:
   ```markdown

   ### <ID>. <description>
   - Status: [ ] TODO
   - Priority: <selected priority>
   - Created: <today's date>
   - Description: <description>
   ```
6. Update the Summary section:
   - Increment Total
   - Increment TODO count
   - Update Last updated date
7. Commit the changes to git:
   ```bash
   git add TASKS.md
   git commit -m "task: add task #<ID> - <description>"
   ```
</process>

<context>
Arguments: $ARGUMENTS (task description)
Current date: !`date +%Y-%m-%d`
TASKS.md location: ./TASKS.md
</context>

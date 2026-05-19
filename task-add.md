---
name: task-add
description: Add a new task to existing TASKS.md with priority selection
argument-hint: "<task description>"
permissions:
   read: true
   write: true
   bash: true
   question: true
---

<objective>
Add a new task to the existing TASKS.md file. If the file doesn't exist, suggest using /task-create first.
</objective>

<process>
1. Check if TASKS.md exists in the current project root
2. If it doesn't exist:
   - Show error: "TASKS.md not found. Run /task-create first to initialize it."
   - Abort
3. Read TASKS.md and find all existing task IDs (### 1., ### 2., etc.)
4. Determine next ID = highest existing ID + 1
5. Ask the user for priority: "What priority for this task?" with options: high, medium, low
6. Append the new task to the end of the file:
   ```markdown

   ### <ID>. <description>
   - Status: [ ] TODO
   - Priority: <selected priority>
   - Created: <today's date>
   - Description: <description>
   ```
7. Update the Summary section:
   - Increment Total count
   - Increment TODO count
   - Update "Last updated" to today's date
8. Commit the changes to git:
   ```bash
   git add TASKS.md
   git commit -m "task: add task #<ID> - <description>"
   ```
9. Confirm: "Task #<ID> added with <priority> priority."
</process>

<context>
Arguments: $ARGUMENTS (task description)
Current date: !`date +%Y-%m-%d`
TASKS.md location: ./TASKS.md
</context>

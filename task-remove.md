---
name: task-remove
description: Remove a task from TASKS.md by ID with confirmation
argument-hint: "<task ID>"
permissions:
   read: true
   write: true
   bash: true
   question: true
---

<objective>
Remove a specific task from TASKS.md by its ID. Requires confirmation before deletion.
</objective>

<process>
1. Check if TASKS.md exists
   - If not: "TASKS.md not found. Run /task-create first."
   - Abort

2. Check if $ARGUMENTS (ID) is provided
   - If not: "Usage: /task-remove <ID>. Run /task-summary to see task IDs."
   - Abort

3. Read TASKS.md and find the task with the specified ID
   - If not found: "Task #<ID> not found."
   - Abort

4. Show the task details and ask for confirmation:
   "Remove task #<ID>: <description>? This cannot be undone. (yes/no)"

5. If no:
   - Abort: "Task removal cancelled."

6. If yes:
   a. Remove the task section from TASKS.md (from ### <ID>. to the next ### or end of file)
   b. Update the Summary section:
      - Decrement Total count
      - Decrement the appropriate status count (TODO, IN_PROGRESS, or DONE)
      - Update "Last updated" to today's date
   c. Commit the changes to git:
      ```bash
      git add TASKS.md
      git commit -m "task: remove task #<ID>"
      ```
   d. Confirm: "Task #<ID> removed successfully."
   e. Show updated summary using /task-summary
</process>

<context>
Arguments: $ARGUMENTS (task ID to remove)
Current date: !`date +%Y-%m-%d`
TASKS.md location: ./TASKS.md
</context>

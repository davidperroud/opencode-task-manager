---
name: task-execute
description: Execute tasks from TASKS.md - all pending or a specific task by ID
argument-hint: "[task ID]"
permissions:
   read: true
   write: true
   bash: true
   question: true
---

<objective>
Execute tasks from TASKS.md. Without arguments, execute all TODO tasks in order. With an ID, execute that specific task.
Updates status: TODO [ ] → IN_PROGRESS [~] → DONE [x]
</objective>

<process>
1. Check if TASKS.md exists
   - If not: "TASKS.md not found. Run /task-create first."
   - Abort

2. Read TASKS.md and parse all tasks with their IDs and statuses

3. If $ARGUMENTS (ID) is provided:
   - Find the task with that ID
   - If not found: "Task #<ID> not found."
   - If found:
     a. If status is [ ] TODO:
        - Update to [~] IN_PROGRESS
        - Update "Last updated" date
        - Commit: "task: start task #<ID>"
        - Read the task description
        - Execute the task: "Execute this task: <description>"
        - After execution, update to [x] DONE
        - Add "Completed: <today's date>"
        - Update summary (decrement IN_PROGRESS, increment DONE)
        - Commit: "task: complete task #<ID>"
        - Confirm: "Task #<ID> completed."
     b. If status is [~] IN_PROGRESS:
        - Ask: "Task #<ID> is in progress. Mark as done?" (yes/no)
        - If yes: update to [x] DONE, add completed date, update summary, commit
        - If no: abort
     c. If status is [x] DONE:
        - Show: "Task #<ID> is already done."

4. If no ID provided (execute all):
   - Find all tasks with status [ ] TODO
   - If none: "No pending tasks. All tasks are completed!"
   - CONTINUOUS MODE (default):
     - Execute all TODO tasks in sequence WITHOUT stopping between them
     - Only pause if a question arises or clarification is needed
     - For each TODO task in order:
       a. Update to [~] IN_PROGRESS
       b. Update "Last updated" date
       c. Commit: "task: start task #<ID>"
       d. Read the task description
       e. Execute the task: "Execute this task: <description>"
       f. After execution, update to [x] DONE
       g. Add "Completed: <today's date>"
       h. Update summary counts
       i. Commit: "task: complete task #<ID>"
       j. Continue immediately to next task (DO NOT ask for confirmation)
   - Show final summary: "All tasks executed. X tasks completed."

5. After any change, run /task-summary to show updated state
</process>

<context>
Arguments: $ARGUMENTS (optional task ID)
Current date: !`date +%Y-%m-%d`
TASKS.md location: ./TASKS.md
</context>

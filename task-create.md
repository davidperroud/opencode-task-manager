---
name: task-create
description: Initialize a new TASKS.md file in the project root
argument-hint: "(no arguments)"
permissions:
   read: true
   write: true
   bash: true
   question: false
---

<objective>
Create a new TASKS.md file with the base structure in the current project root.
If TASKS.md already exists, ask the user if they want to overwrite it.
</objective>

<process>
1. Check if TASKS.md exists in the current project root
2. If it exists, ask: "TASKS.md already exists. Do you want to overwrite it?" (yes/no)
   - If no, abort and show current summary using /task-summary
3. Create TASKS.md with the following content:
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
4. Commit the new file to git:
   ```bash
   git add TASKS.md
   git commit -m "task: initialize TASKS.md"
   ```
5. Confirm creation: "TASKS.md created successfully. Use /task-add to add tasks."
</process>

<context>
Current date: !`date +%Y-%m-%d`
TASKS.md location: ./TASKS.md
</context>

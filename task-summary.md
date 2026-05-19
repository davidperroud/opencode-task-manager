---
name: task-summary
description: Display a summary of all tasks and their statuses from TASKS.md
argument-hint: "(no arguments)"
permissions:
   read: true
   write: false
   bash: false
   question: false
---

<objective>
Read TASKS.md and display a comprehensive summary of all tasks, their statuses, and statistics.
</objective>

<process>
1. Check if TASKS.md exists
   - If not: "TASKS.md not found. Run /task-create to initialize it."
   - Abort

2. Read TASKS.md

3. Parse and display:

   ```
   ╔══════════════════════════════════════════╗
   ║          TASK SUMMARY                    ║
   ╚══════════════════════════════════════════╝

   Created: <date>
   Last updated: <date>

   ── Statistics ──────────────────────────────
   Total:         <count>
   TODO:          <count>
   IN_PROGRESS:   <count>
   DONE:          <count>

   ── In Progress [~] ─────────────────────────
   #<ID>. <description> (Priority: <priority>)
   ...or "None"

   ── Pending [ ] ─────────────────────────────
   #<ID>. <description> (Priority: <priority>)
   ...or "None"

   ── Completed [x] ───────────────────────────
   #<ID>. <description> (Completed: <date>)
   ...or "None"
   ```

4. If there are high priority pending tasks, highlight them:
   "⚠ High priority tasks pending: #<ID>, #<ID>"
</process>

<context>
TASKS.md location: ./TASKS.md
</context>

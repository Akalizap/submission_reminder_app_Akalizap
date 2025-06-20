Submission Reminder App

This shell script-based app helps track which students have not submitted a given assignment.

## Features

- Automatically creates environment folders and files.
- Tracks assignment submission status.
- Allows changing the assignment and checking updated submissions.

## How to Use

### Step 1: Setup

Run the setup script:

```bash
bash create_environment.sh
Enter your name when prompted.

Step 2: Check Submissions
Start the app:

bash
cd submission_reminder_Akalizap
bash startup.sh

Step 3: Update Assignment
Return to root and run:

bash
bash copilot_shell_script.sh
GitHub Repository
Your repository should be named:

submission_reminder_app_YourGitHubUsername
Files to include:

create_environment.sh

copilot_shell_script.sh

README.md

---

## ✅ **4. Git Workflow**

```bash
# Create repo and clone it
git init
git checkout -b feature/setup

# Add and commit scripts
git add create_environment.sh copilot_shell_script.sh README.md
git commit -m "Initial feature implementation"

# Switch and merge to main
git checkout -b main
git merge feature/setup

# Push to GitHub
git remote add origin https://github.com/YourUsername/submission_reminder_app_YourGitHubUsername.git
git push -u origin main

#!/bin/bash

# Prompt for user name
read -p "Enter your name: " username
app_dir="submission_reminder_${username}"

# Create base directories
mkdir -p "${app_dir}"/{assets,config,modules}

# Create and populate config.env
cat > "${app_dir}/config/config.env" <<EOL
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create and populate submissions.txt
cat > "${app_dir}/assets/submissions.txt" <<EOL
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Kamanzi, Shell Navigation, not submitted
Ishimwe, Git, not submitted
Sifa, Shell Navigation, submitted
Olivier, Shell Basics, not submitted
Teta, Shell Navigation, not submitted
EOL

# Create and populate functions.sh
cat > "${app_dir}/modules/functions.sh" <<'EOL'
#!/bin/bash
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOL

# Create and populate reminder.sh
cat > "${app_dir}/modules/reminder.sh" <<'EOL'
#!/bin/bash
source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# Create and populate startup.sh
cat > "${app_dir}/startup.sh" <<'EOL'
#!/bin/bash
bash ./modules/reminder.sh
EOL

# Make all .sh files executable
find "${app_dir}" -name "*.sh" -exec chmod +x {} \;

echo "Environment setup complete at ./${app_dir}"


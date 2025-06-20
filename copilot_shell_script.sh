#!/bin/bash

# Ask user for new assignment name
read -p "Enter the new assignment name: " new_assignment

# Update config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" ./submission_reminder_*/config/config.env

# Rerun the app
./submission_reminder_*/startup.sh


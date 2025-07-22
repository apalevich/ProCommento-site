#!/bin/bash

# Find the full paths to git and npm
# Run 'which git' and 'which npm' in your terminal to get these paths
GIT_PATH="/usr/bin/git"
NPM_PATH="/root/.nvm/versions/node/v18.20.8/bin/npm" # Example NVM path, adjust if needed

# The directory of your React app
PROJECT_DIR="/var/www/ProCommento-site"

# Log file
LOG_FILE="/var/www/ProCommento-site/procommento_app_update.log"

# --- SCRIPT START ---
echo "--- Starting update at $(date) ---" >> $LOG_FILE
cd $PROJECT_DIR || exit

$GIT_PATH pull >> $LOG_FILE 2>&1
$NPM_PATH install >> $LOG_FILE 2>&1 # Good practice to install dependencies in case they changed
$NPM_PATH run build >> $LOG_FILE 2>&1

echo "--- Update finished at $(date) ---" >> $LOG_FILE
echo "" >> $LOG_FILE

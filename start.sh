#!/bin/sh

# Start the backend first
pm2 start backend/app.js --name backend --watch false
echo "Backend started."

# Start the frontend
pm2 start npm --name frontend -- start --prefix frontend
echo "Frontend started."

# Keep the script running (this line is optional)
tail -f /dev/null

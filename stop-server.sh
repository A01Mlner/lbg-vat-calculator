#!/bin/bash
# Find the PID of the server and kill it (for Node.js-based servers)
SERVER_PID=$(ps aux | grep 'node' | grep -v 'grep' | awk '{print $2}')
if [ -z "$SERVER_PID" ]; then
  echo "Server is not running."
else
  echo "Stopping server with PID $SERVER_PID..."
  kill $SERVER_PID
fi


#!/bin/bash

while true
do
    echo "Starting bot at $(date)"

    # Use expect to handle the interactive prompts
    expect <<EOF &
spawn python3 bot.py

# Handle the "Enter Referral Code" prompt
expect "Select Option:" { send "2\r" }

# Wait for the "How many do you want?" prompt
expect "How Many Times Do You Want To Make a Transfer" { send "20\r" }

expect "Enter Amount for Each Transfers" { send "0.0001\r" }

expect "Min Delay Each Tx" { send "6\r" }

expect "Max Delay Each Tx" { send "10\r" }

expect "Choose" { send "3\r" }
# Allow time for the process to run
expect eof
EOF

    echo "Bot running for 2 hours..."
    sleep 7200

    # Kill the bot after 1 hour
    echo "Stopping bot at $(date)..."
    pkill -f "python3 bot.py"

    echo "Waiting 30 minutes before restarting..."
    sleep 1800
done


#clear && chmod +x bot.sh && ./bot.sh

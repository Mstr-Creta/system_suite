#!/bin/bash


echo "🖥️  Welcome to the System Monitor Script"
echo "📅 Run time: $(date)"
echo

#System Info
echo "📊 System Information:"
hostnamectl
echo

#Kernel Status
echo "🧠 Kernel Status:"
uname -r
uptime
echo

#Process Summary
echo "⚙️  Process Summary:"
echo "🔹 Total processes: $(ps -e --no-headers | wc -l)"
echo "🔹 Running:         $(ps -eo stat | grep -c '^R')"
echo "🔹 Sleeping:        $(ps -eo stat | grep -c '^S')"
echo "🔹 Stopped:         $(ps -eo stat | grep -c '^T')"
echo "🔹 Zombie:          $(ps -eo stat | grep -c '^Z')"
echo

#Foreground & Background Processes
echo "🎛️  Foreground and Background Processes:"
echo "🔸 Foreground (TTY attached):"
ps -eo pid,tty,stat,comm | grep -v '?' | grep -v 'tty' || echo "  None"
echo
echo "🔸 Background (no TTY):"
ps -eo pid,tty,stat,comm | grep '?' || echo "  None"
echo

#Suspended Processes
echo "⏸️  Suspended Processes (Status 'T'):"
SUSPENDED=$(ps -eo pid,stat,comm | awk '$2 ~ /T/')
if [ -z "$SUSPENDED" ]; then
    echo "✅ No suspended processes found."
else
    echo "$SUSPENDED"
fi
echo

#Log
echo "🧾 Log Monitor: Scanning for ERROR, Failed, CRITICAL, Warning"
echo "Scan started at: $(date)"
echo

echo "Using journalctl to scan logs..."
journalctl -p 3..4 -xb | grep -i -E "ERROR|Failed|CRITICAL|Warning" | tail -n 20 || echo "✅ No recent critical log entries found."

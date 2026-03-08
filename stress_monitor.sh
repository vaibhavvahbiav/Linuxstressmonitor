#!/bin/bash

echo "Starting CPU stress test..."
echo "Press Ctrl + C to stop."
echo ""

stress -c $(nproc) &
STRESS_PID=$!

while true 
do 
	clear

	TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
	TEMP_C=$(echo "$TEMP/1000" | bc -l)

	echo "=== LiNux Stress test ==="
	echo ""
	echo "CPU cores stressed : $(nproc)"
	echo "Temperature : ${TEMP_C} 'C"
	echo ""
	echo "LOad average:"
	uptime
	echo ""
	echo "CPU usage:"
	top -bn1 | grep "Cpu(s)"
	echo ""
	echo "Memoery:"
	free -h
	echo ""
	echo "made by Vaibhav"

	sleep 1
done

kill $STRESS_PID


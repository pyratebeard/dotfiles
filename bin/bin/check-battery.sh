#!/usr/bin/env bash

BAT_NUM='0'
STATUS_FILE=/tmp/check-bat.tmp
BATTPERC=$(cat /sys/class/power_supply/BAT${BAT_NUM}/capacity)
BATTSTATUS=$(cat /sys/class/power_supply/BAT${BAT_NUM}/status)
LAST_STATUS=''
LAST_NOTIF_LEVEL=0
NOTIF_LEVEL=0

if [ -e $STATUS_FILE ] ; then
	. $STATUS_FILE
fi

save_status() {
	LAST_STATUS=$BATTSTATUS
	echo "LAST_STATUS=${BATTSTATUS}" > $STATUS_FILE
	echo "LAST_NOTIF_LEVEL=${NOTIF_LEVEL}" >> $STATUS_FILE
}

notify() {
	level=$1
	msg=$2
	DISPLAY=:0 /usr/bin/notify-send -t 3500 -u "$level" "POWER" "$msg"
}

# Battery status changed
if [[ "$BATTSTATUS" != "$LAST_STATUS" ]] ; then
	notify "normal" "battery is now $BATTSTATUS, Capacity: $BATTPERC"
	save_status
	exit
fi

if [ "$BATTSTATUS" = Discharging ] && [ "$BATTPERC" -le 10 ]; then
	NOTIF_LEVEL=10
	notify "critical" "battery is less than 10% - Connect charger, going to sleep in 10s"
	sleep 10
	BATTSTATUS=$(cat /sys/class/power_supply/BAT${BAT_NUM}/status)
	if [ "$BATTSTATUS" = Discharging ]; then
		notify "critical" "going to suspend now"
		sleep 3
		logger "Critical battery threshold, suspending"
		systemctl suspend
	else
		notify "normal" "battery is now charging, cancelling suspend"
	fi
	save_status
	exit
fi

if [[ $BATTPERC -le 20 ]] ; then
	NOTIF_LEVEL=20
	notify "critical" "battery $BATTSTATUS is less than 20%"
	save_status
elif [[ $BATTPERC -le 30 ]] ; then
	NOTIF_LEVEL=30
	if [ "$NOTIF_LEVEL" != "$LAST_NOTIF_LEVEL" ]; then
		notify "normal" "battery $BATTSTATUS is at 30%"
		save_status
	fi
elif [[ $BATTPERC -le 50 ]] ; then
	NOTIF_LEVEL=50
	if [ "$NOTIF_LEVEL" != "$LAST_NOTIF_LEVEL" ] ; then
		notify "low" "battery $BATTSTATUS is at 50%"
		save_status
	fi
elif [[ $BATTPERC -le 60 ]] ; then
	NOTIF_LEVEL=60
	if [ "$NOTIF_LEVEL" != "$LAST_NOTIF_LEVEL" ] ; then
		notify "normal" "battery $BATTSTATUS is at 60%"
		save_status
	fi
fi


#!/usr/bin/env zsh
if [[ $(screen -ls) != *"interop_fix"* ]] then
	echo "No interop screen found; starting one now."
	sleep 1
	screen -dmS interop_fix ~/.local/bin/fix_interop.sh
fi


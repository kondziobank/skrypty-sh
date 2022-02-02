#!/usr/bin/env bash

comm_mode=''
if [ -z "$1" ]; then
	echo "Podaj tryb działania programu jako pierwszy argument linii poleceń"
	exit
elif [ "$1" == "pointed" ]; then
	comm_mode="-12"
elif [ "$1" == "notpointed" ]; then
	comm_mode="-23"
else
	echo "Podaj poprawny tryb działania programu: pointed lub notpointed"
	exit
fi

file=''
if [ ! -z "$2" ]; then
	file=$2
elif [ ! -z "$USERS" ]; then
	file=$USERS
else
	file="users.txt"
fi

if [ ! -f "$file" ]; then
	echo "Plik $file nie istnieje!"
	exit
fi

for username in `who | cut -d' ' -f1 | sort | uniq | comm "$comm_mode" - "$file"`; do
	echo "Wysyłam wiadomość do $username"
	echo 'Dzień dobry!' | write $username
done


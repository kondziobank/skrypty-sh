#!/usr/bin/env bash

BACKUP_DIRECTORY=~/BACKUP

if [ -z "$1" ]; then
	echo "Proszę podać nazwę pliku jako parametr"
	exit
fi

if [ ! -f "$1" ]; then
	echo "Plik przekazany jako argument nie istnieje"
	exit
fi


backup="$BACKUP_DIRECTORY/$1"

if [ -f "$backup" ] && cmp -s "$1" "$backup"; then
	echo "Plik zapasowy istnieje i jest identyczny"
else
	echo "Plik zapasowy nie istnieje lub nie jest identyczny"
fi


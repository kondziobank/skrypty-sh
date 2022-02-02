#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "Podaj nazwę pliku jako parametr"
	exit
fi

file="$1.bak"

while [ -f "$file" ]; do
	file="$file.bak"
done

cp "$1" "$file"
vim "$1"


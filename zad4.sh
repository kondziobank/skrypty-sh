#!/usr/bin/env bash

for filename in $@; do
	reply=''
	if [ ! -f "$filename" ]; then
		reply="nie istnieje"
	elif [[ $filename == *.c ]] || [[ $filename == *.h ]]; then
		lines=`cat $filename | wc -l`
		reply="$lines linii"
	elif [[ $filename == *.txt ]]; then
		words=`cat $filename | wc -w`
		reply="$words słów"
	else
		chars=`cat $filename | wc -m`
		reply="$chars znaków"
	fi

	echo "Plik $filename -> $reply"
done



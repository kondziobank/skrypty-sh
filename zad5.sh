if [ -z "$1" ]; then
	echo "Proszę podać prefiks jako pierwszy argument linii poleceń"
	exit
elif [ -z "$2" ]; then
	echo "Proszę podać początek zakresu jako drugi argument linii poleceń"
	exit
elif [ -z "$3" ]; then
	echo "Proszę podać koniec zakresu jako trzeci argument linii poleceń"
	exit
fi

prefix=$1
range_begin=$2
range_end=$3

extension=''
if [ ! -z "$4" ]; then
	extension=".$4"
fi

for (( i=$range_begin; i<=$range_end; i++ )); do
	number=`printf "%02d" $i`
	touch "$prefix$number$extension"
done


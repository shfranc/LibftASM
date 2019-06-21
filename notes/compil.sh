#/bin/bash

if [ -z "$1" ] ; then
	echo "usage: ./compil.sh src.s"
	exit
else
	SRC=$(basename $1 .s)
fi

nasm -f macho $SRC.s -o $SRC.o
ld $SRC.o -macosx_version_min 10.8 -lSystem

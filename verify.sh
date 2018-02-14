#/bin/bash
spin -a $1
gcc -o pan pan.c
rm `ls pan.*`
./pan -t $1

#!/bin/sh
 
n=0
name=$1
kakutyousi=$2
 
if [ $# -ne 2 ]; then
    echo "error!"
else
    for i in *.${kakutyousi}
    do
    if [ ${n} -lt 10 ]; then
        a=000${n}
    elif [ \( ${n} -ge 10 \) -a \( ${n} -lt 100 \) ]; then
        a=00${n}
    elif [ \( ${n} -ge 100 \) -a \( ${n} -lt 1000 \) ]; then
        a=0${n}
    elif [ \( ${n} -ge 1000 \) -a \( ${n} -lt 10000 \) ]; then
        a=${n}
    else
        echo "over flow"
        exit
    fi
 
    mv $i ${name}${a}.${kakutyousi}
    n=`expr $n + 1`
 
    done
fi

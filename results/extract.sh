#!/bin/bash


 ## 1 - index
       ## 2 - slots
       ## 3 - largura de e
       ## 4 - largura de d
       ## 5 - largura de p
       ## 6 - largura de o
       ## 7 - media de recursos de e
       ## 8 - media de recursos de d
       ## 9 - media de recursos de p
       ## 10- media de recursos de s
       ## 11- media de score de e
       ## 12- media de score de d
       ## 13- media de score de p
       ## 14- media de score de s
       ## 15- max S e
       ## 16- max S d
       ## 17- max S p
       ## 18- max S o
       ## 19- max R e
       ## 20- max R d
       ## 21- max R p
       ## 22- max R o
       ## 23- min S e
       ## 24- min S d
       ## 25- min S p
       ## 26- min S o
       ## 27- min R e
       ## 28- min R d
       ## 29- min R p
       ## 30- min R o



I=0
cat ${1} | while read LINE; do
    MIN_RE_VALUE=$(echo ${LINE} |cut -d';' -f23)
    MIN_SE_VALUE=$(echo ${LINE} |cut -d';' -f27)

    MAX_SD_VALUE=$(echo ${LINE} |cut -d';' -f16)
    MAX_SP_VALUE=$(echo ${LINE} |cut -d';' -f17)
    MAX_SO_VALUE=$(echo ${LINE} |cut -d';' -f18)

    MAX_RD_VALUE=$(echo ${LINE} |cut -d';' -f20)
    MAX_RP_VALUE=$(echo ${LINE} |cut -d';' -f21)
    MAX_RO_VALUE=$(echo ${LINE} |cut -d';' -f22)

 
    if [[ ${MAX_SD_VALUE} > ${MIN_SE_VALUE} || ${MAX_SP_VALUE} > ${MIN_SE_VALUE} || ${MAX_SO_VALUE} > ${MIN_SE_VALUE} ]]; then
        I=$((I+1))
        echo $I
    fi

done

echo $I

## EOF.

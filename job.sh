#!/bin/bash
tail -20 /var/log/supervisor/lo-fi-collector.out.log > ~/usbreset/tail.txt
TENS=$(grep -c '10 readings' ~/usbreset/tail.txt)
if [[ $TENS -lt 1 ]]
then
    bash ~/usbreset/reset.sh
fi

#!/bin/bash
tail -20 /var/log/supervisor/lo-fi-collector.out.log > /home/pi/usbreset/tail.txt
TENS=$(grep -c '10 readings' /home/pi/usbreset/tail.txt)
if [[ $TENS -lt 1 ]]
then
    bash /home/pi/usbreset/reset.sh
fi

#!/bin/bash
tail -20 /var/log/supervisor/lo-fi-collector.out.log > /home/pi/usbreset/tail.txt
TENS=$(grep -c '10s' /home/pi/usbreset/tail.txt)
echo "Time: $(date). Checking for bad sensorbox" >> /home/pi/usbreset/log.txt
if [[ $TENS -lt 1 ]]
then
    bash /home/pi/usbreset/reset.sh
    echo "Time: $(date). Resetting sensorbox" >> /home/pi/usbreset/log.txt
fi

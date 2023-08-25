#!/bin/bash
#https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash
#https://ryanstutorials.net/bash-scripting-tutorial/bash-loops.php
counter=1
while [ $counter -le 20 ]
do
pingtime=$(ping -w 1 8.8.8.8 | grep ttl)
if [ "$pingtime" = "" ] 
then 
       echo 'Offline'
       echo $counter
	((counter=counter+1))
else
    echo 'Online'
    /home/xxUserxx/.cam-background_setup/cam-background.sh
    ((counter=counter+20))
fi
sleep 1
done
echo All done
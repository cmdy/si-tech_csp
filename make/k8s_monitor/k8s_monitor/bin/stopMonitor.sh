ps -fucloud | grep k8sMonitor | grep -v killer | grep -v grep | cut -b 9-17 | while read line
do
   kill -9 $line
   echo  "Process $line was killed!"
done

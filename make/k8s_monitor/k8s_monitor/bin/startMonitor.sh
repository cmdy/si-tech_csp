PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`
. $AGENTHOME/bin/setenv.sh

PRO_KEY=k8sMonitor
AGT_CLASS="com.sitech.kubernetes.coll.CollAllRes"

pro_count=`ps -ef | grep ${PRO_KEY} | grep -v grep | wc -l`
if [ $pro_count -lt 1 ]
then
nohup java -D${PRO_KEY} -Djavax.management.builder.initial=mx4j.server.MX4JMBeanServerBuilder ${AGT_CLASS}  1>/dev/null 2>&1
echo "k8sMonitor startup "
else
echo "there is already ${pro_count} process with key ${PRO_KEY} exists"
fi

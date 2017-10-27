PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`
. $AGENTHOME/bin/setenv.sh

PRO_KEY=k8sMonitor
AGT_CLASS="com.sitech.kubernetes.coll.CollAllRes"

java -D${PRO_KEY} -Djavax.management.builder.initial=mx4j.server.MX4JMBeanServerBuilder ${AGT_CLASS}

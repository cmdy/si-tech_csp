JAVA_HOME=/jdk1.8.0_91
AGENT_HOME=/k8s_monitor
LIBS_HOME=${AGENT_HOME}/lib
PATH=${JAVA_HOME}/bin:${PATH}:/usr/sbin:/usr/bin:/etc
CLASSPATH=${AGENT_HOME}/config:${LIBS_HOME}/*
LANG=zh_CN.gb18030

export LANG
export JAVA_HOME
export AGENT_HOME
export LIBS_HOME
export PATH
export CLASSPATH

echo "Stopping Accumulo"
$ACCUMULO_HOME/bin/stop-all.sh
echo "Stopping Zookeeper"
$ZOOKEEPER_HOME/bin/zkServer.sh stop
echo "Stopping Hadoop"
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver
$HADOOP_HOME/sbin/stop-yarn.sh
$HADOOP_HOME/sbin/stop-dfs.sh

echo "---------Done--------"
jps -lm | grep apache | sort

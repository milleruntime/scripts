echo "Starting HADOOP"
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
echo "Waiting for Hadoop to finish..."
sleep 5
echo "... OK"
echo "Starting Zookeeper"
cd $ZOOKEEPER_HOME && ./bin/zkServer.sh start

echo "Starting Accumulo"
$ACCUMULO_HOME/bin/start-all.sh

echo "-----------DONE---------"
jps -lm | grep apache | sort

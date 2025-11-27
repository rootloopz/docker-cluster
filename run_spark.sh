#!/bin/bash

# Start Spark master on node1
if [ "$HOSTNAME" = "mpi-node1" ]; then
    nohup spark-class org.apache.spark.deploy.master.Master > /tmp/spark-master.log 2>&1 &
    sleep 30
fi

sleep 10
# Start Spark worker on all nodes
nohup spark-class org.apache.spark.deploy.worker.Worker spark://mpi-node1:7077 > /tmp/spark-worker.log 2>&1 &


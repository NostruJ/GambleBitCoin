#!/bin/bash
# Submit Flink job to the cluster
FLINK_HOME=/opt/flink
JAR_PATH=/opt/flink/lib/flink-sql-connector-kafka.jar
JOB_CLASS=flink_streaming_job

echo "Submitting Flink job..."
$FLINK_HOME/bin/flink run \
    --jobmanager jobmanager:8081 \
    --class $JOB_CLASS \
    $JAR_PATH

echo "Job submitted successfully."

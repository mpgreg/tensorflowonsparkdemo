#!/usr/bin/env bash

spark-submit \
--conf spark.yarn.appMasterEnv.PYSPARK_PYTHON=./TF/tf_env/bin/python \
--conf spark.yarn.appMasterEnv.PYSPARK_DRIVER_PYTHON=./TF/tf_env/bin/python \
--master yarn \
--deploy-mode client \
--num-executors 4 \
--executor-memory 4G \
--py-files TensorFlowOnSpark/tfspark.zip,TensorFlowOnSpark/examples/mnist/spark/mnist_dist.py \
--archives tf_env.zip#TF \
--conf spark.dynamicAllocation.enabled=false \
--conf spark.yarn.maxAppAttempts=1 \
--conf spark.executorEnv.LD_LIBRARY_PATH="/opt/cloudera/parcels/CDH/lib64:$JAVA_HOME/jre/lib/amd64/server" \
TensorFlowOnSpark/examples/mnist/spark/mnist_spark.py \
--images mnist/csv/train/images \
--labels mnist/csv/train/labels \
--mode train \
--model mnist_model

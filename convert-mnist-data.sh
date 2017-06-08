#!/usr/bin/env bash

# save images and labels as CSV files
spark-submit \
--conf spark.yarn.appMasterEnv.PYSPARK_PYTHON=./TF/tf_env/bin/python \
--conf spark.yarn.appMasterEnv.PYSPARK_DRIVER_PYTHON=./TF/tf_env/bin/python \
--master yarn \
--deploy-mode client \
--num-executors 4 \
--executor-memory 4G \
--archives tf_env.zip#TF,mnist/mnist.zip#mnist \
TensorFlowOnSpark/examples/mnist/mnist_data_setup.py \
--output mnist/csv \
--format csv

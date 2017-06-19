!bash ./create-tf-conda-env.sh

!bash ./get_tf_on_spark.sh

!bash ./prepare-mnist-data.sh

!pip install tensorflow

!bash ./convert-mnist-data.sh

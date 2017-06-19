!bash ./create-tf-conda-env.sh

!bash ./get_tf_on_spark.sh

!bash ./prepare-mnist-data.sh

!unzip tf_env.zip
!mv tf_env .local

!bash ./convert-mnist-data.sh

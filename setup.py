!bash ./create-tf-conda-env.sh

!git clone -b leewyang_keras https://github.com/yahoo/TensorFlowOnSpark

!bash ./prepare-mnist-data.sh

!bash ./convert-mnist-data.sh

#!/bin/bash

git clone -b leewyang_keras https://github.com/yahoo/TensorFlowOnSpark
pushd TensorFlowOnSpark/src
zip -r ../tfspark.zip *
popd
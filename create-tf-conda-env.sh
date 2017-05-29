#!/usr/bin/env bash

# Install a local copy of anaconda for the current user
wget https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh
chmod 755 Anaconda2-4.3.1-Linux-x86_64.sh
sh Anaconda2-4.3.1-Linux-x86_64.sh -f -b
export PATH=$HOME/anaconda2/bin:$PATH

# Create a conda env and install necessary packages (tensorflow primarily)
conda create -n tf_env --copy -y -q python=2
source activate tf_env
conda install -y python=2.7.11
pip install pydoop
conda install -y -c conda-forge tensorflow
source deactivate tf_env

# Zip up the env, ready for shipping across the Spark cluster
DIR=$(pwd)
(cd ~/anaconda2/envs; zip -r $DIR/tf_env.zip tf_env)

# Remove anaconda and envs
rm Anaconda2-*.sh
rm -rf $HOME/anaconda2
rm -rf $HOME/.conda
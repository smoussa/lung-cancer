#!/bin/bash

# (ami-405f7226)

# https://developer.nvidia.com/cuda-downloads
# http://developer.download.nvidia.com/compute/cuda/8.0/secure/Prod2/docs/sidebar/CUDA_Installation_Guide_Linux.pdf?autho=1490468400_1d9e85a577063cef9c9ef953fe730b7c&file=CUDA_Installation_Guide_Linux.pdf

sudo locale-gen en_GB.UTF-8
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y gcc g++ cmake unzip p7zip-full
sudo apt-get install linux-headers-$(uname -r)
wget "http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb" -O "cuda-repo-ubuntu1604_8.0.61-1_amd64.deb"
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
nvidia-smi

export PATH=~/conda/bin:$PATH
export BLAS=/usr/lib/libblas.so
wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh -b -p ~/conda
rm Anaconda3-4.2.0-Linux-x86_64.sh
conda upgrade -y --all

# git clone https://github.com/Theano/libgpuarray.git
# cd libgpuarray
# mkdir Build
# cd Build
# cmake .. -DCMAKE_BUILD_TYPE=Release
# make
# sudo make install

# echo "[global]
# device = cuda
# floatX = float32

# [cuda]
# root = /usr/local/cuda" > ~/.theanorc

sudo apt install -y python-pip kaggle-cli
pip install pydicom keras tensorflow-gpu

echo '{
    \"backend": \"theano\",
    \"epsilon": 1e-07,
    \"image_data_format": \"channels_last\",
    \"floatx": \"float32\"
}' > ~/.keras/keras.json

wget "http://platform.ai/files/cudnn.tgz" -O "cudnn.tgz"
tar -zxf cudnn.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

# kg download -u [] -p [] -c data-science-bowl-2017
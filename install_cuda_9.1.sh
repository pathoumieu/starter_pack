#! /bin/bash

# 1. install gcc6

# sudo apt install build-essential gcc-6 g++-6

# sudo update-alternatives --remove-all gcc
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 20
# sudo update-alternatives --set gcc /usr/bin/gcc-6

# sudo update-alternatives --remove-all g++
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 10
# sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 20
# sudo update-alternatives --set g++ /usr/bin/g++-6


# 2. install drivers

# sudo modprobe -r nouveau
# sudo apt install nvidia-driver-390 nvidia-headless-390 nvidia-utils-390
# sudo modprobe -i nvidia


# 3. download and install cuda 9.1

pushd /tmp/

curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_387.26_linux
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/1/cuda_9.1.85.1_linux
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/2/cuda_9.1.85.2_linux
curl -LO https://developer.nvidia.com/compute/cuda/9.1/Prod/patches/3/cuda_9.1.85.3_linux

# do not install driver or samples
sudo sh cuda_9.1.85_387.26_linux --silent --override --toolkit

# install the patches
sudo sh cuda_9.1.85.1_linux --silent --accept-eula
sudo sh cuda_9.1.85.2_linux --silent --accept-eula
sudo sh cuda_9.1.85.3_linux --silent --accept-eula
set -e

# set system wide paths
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/cuda/bin"' | sudo tee /etc/environment
echo /usr/local/cuda-9.1/lib64 | sudo tee /etc/ld.so.conf.d/cuda-9.1.conf
sudo ldconfig

rm /tmp/cuda_9.1.85*_linux
popd
set -e

# 4. reboot

# reboot system for changes to take effect
sudo reboot


# 5. check

lsmod | grep nouv && echo FAIL || echo OKAY
lsmod | grep nvid && echo OKAY || echo FAIL

grep -E 'NVIDIA.*390.[0-9]+' /proc/driver/nvidia/version &>/dev/null && echo OKAY || echo FAIL
nvcc -V | grep -E "V9.1.[0-9]+" &>/dev/null && echo OKAY || echo FAIL

# this should return stats for all installed cards
nvidia-smi

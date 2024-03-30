#!/bin/bash

# disable the interactive for location specification.
export DEBIAN_FRONTEND=noninteractive  
export TZ=Asia/Shanghai
  
# install gcc-9
apt-get update  
apt-get install -y g++-9  
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 900  
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 900  
update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-9 900  
update-alternatives --set gcc /usr/bin/gcc-9  
update-alternatives --set g++ /usr/bin/g++-9  
update-alternatives --set cpp-bin /usr/bin/cpp-9  

# install important packages.
apt-get update  
apt-get install -y iputils-ping  
apt-get install -y htop  
apt-get install -y iperf3  
apt-get install -y net-tools  
apt-get install -y vim  
apt-get install -y git 
apt-get install -y python3.8 
apt-get install -y pip 
apt-get install -y cmake 
apt-get install -y libssl-dev 
apt-get install -y libjsoncpp-dev 
apt-get install -y pkg-config 
apt-get install -y libcairo2-dev 
apt-get install -y iperf 
apt-get install -y tmux 
update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 

# cp

USER_FOLDER=/home/tsingj_ubuntu/fanxy/PtA
USER_ROOT_FOLDER=/home/tsingj_ubuntu/

###### install
cp ./packages/cmake-3.18.5.tar.gz $USER_FOLDER/
tar -zxvf $USER_FOLDER/cmake-3.18.5.tar.gz

# upgrade the cmake to 3.18
cd $USER_FOLDER/cmake-3.18.5  
./bootstrap  
make -j$(nproc)  
make install 
cd $USER_FOLDER


rm -r $USER_FOLDER/cmake-3.18.5 
rm $USER_FOLDER/cmake-3.18.5.tar.gz 
export CMAKE_MODULE_PATH=/usr/local/share/cmake-3.18/Modules 
hash -r

# install the MPI3.2
cp ./packages/mpich-3.2.tar.gz $USER_FOLDER/
tar -zxvf $USER_FOLDER/mpich-3.2.tar.gz 

cd $USER_FOLDER/mpich-3.2
./configure --disable-fortran --prefix /usr/local/  
make -j$(nproc)  
make install
cd $USER_FOLDER

rm -rf $USER_FOLDER/mpich-3.2 
rm $USER_FOLDER/mpich-3.2.tar.gz 

##### install

# apt-get update 
# apt-get install -y openssh-server  
# mkdir /var/run/sshd  
# echo 'root:password' | chpasswd  
# sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config  
# echo "export VISIBLE=now" >> /etc/profile

# setup the ssh.
cp -r ./ssh_aby3 $USER_ROOT_FOLDER/.ssh 

git clone git@github.com:Fannxy/aby3.git

# cd $HOME/aby3
cd $USER_FOLDER/aby3/

git checkout -b pta 
git pull origin pta 
git submodule update --init --recursive 
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple 
pip3 install -r $USER_FOLDER/aby3/PtA_deploy/requirements.txt
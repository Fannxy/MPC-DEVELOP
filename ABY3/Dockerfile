FROM ubuntu:20.04  

# disable the interactive for location specification.
ENV DEBIAN_FRONTEND=noninteractive  
ENV TZ=Asia/Shanghai
  
# install gcc-9
RUN apt-get update  
RUN apt-get install -y g++-9  
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 900 \  
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 900 \  
    && update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-9 900 \  
    && update-alternatives --set gcc /usr/bin/gcc-9 \  
    && update-alternatives --set g++ /usr/bin/g++-9 \  
    && update-alternatives --set cpp-bin /usr/bin/cpp-9  

# install important packages.
RUN apt-get update && \  
    apt-get install -y iputils-ping && \  
    apt-get install -y htop && \  
    apt-get install -y iperf3 && \  
    apt-get install -y net-tools && \  
    apt-get install -y vim && \  
    apt-get install -y git && \
    apt-get install -y python3.8 && \ 
    apt-get install -y pip && \
    apt-get install -y cmake && \
    apt-get install libssl-dev && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /root/

# cp
COPY ./packages/cmake-3.18.5.tar.gz /root/
RUN tar -zxvf cmake-3.18.5.tar.gz

# upgrade the cmake to 3.18
WORKDIR /root/cmake-3.18.5  
RUN ./bootstrap && \  
    make -j$(nproc) && \  
    make install 

RUN rm -rf /usr/local/share/cmake-3.16 && \
    rm -r /root/cmake-3.18.5 && \
    rm /root/cmake-3.18.5.tar.gz && \
    export CMAKE_MODULE_PATH=/usr/local/share/cmake-3.18/Modules && \
    hash -r

WORKDIR /root/

# install the MPI3.2
COPY ./packages/mpich-3.2.tar.gz /root/
RUN tar -zxvf mpich-3.2.tar.gz

WORKDIR /root/mpich-3.2
RUN ./configure --disable-fortran && \  
    make -j$(nproc) && \  
    make install

RUN rm -rf /root/mpich-3.2 && \
    rm /root/mpich-3.2.tar.gz

WORKDIR /root/

RUN apt-get update && apt-get install -y openssh-server && \  
    mkdir /var/run/sshd && \  
    echo 'root:password' | chpasswd && \  
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \  
    echo "export VISIBLE=now" >> /etc/profile

# setup the ssh.
COPY ./ssh_aby3 /root/.ssh 

RUN git clone git@github.com:Fannxy/aby3.git

WORKDIR /root/aby3

RUN python build.py --setup

CMD ["./bin/bash"] 

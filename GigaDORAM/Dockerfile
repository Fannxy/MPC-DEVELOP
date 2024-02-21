FROM ubuntu:22.04  

# disable the interactive for location specification.
ENV DEBIAN_FRONTEND=noninteractive  
ENV TZ=Asia/Shanghai

# install important packages.
RUN apt-get update && \  
    apt-get install -y iputils-ping && \  
    apt-get install -y htop && \  
    apt-get install -y iperf3 && \  
    apt-get install -y net-tools && \  
    apt-get install -y vim && \  
    apt-get install -y git && \
    apt-get install -y python3.10 && \ 
    apt-get install -y cmake && \
    apt-get install libssl-dev && \
    apt-get install -y sudo && \
    apt-get install -y g++ && \
    apt-get install -y iproute2 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 && \
    rm -rf /var/lib/apt/lists/* 

# allow root user login.
RUN apt-get update && apt-get install -y openssh-server && \  
    mkdir /var/run/sshd && \  
    echo 'root:password' | chpasswd && \  
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \  
    echo "export VISIBLE=now" >> /etc/profile

# setup the ssh.
COPY ./ssh_github /root/.ssh 

WORKDIR /root

RUN git clone git@github.com:Fannxy/GigaDORAM.git

WORKDIR /root/GigaDORAM

# install the dependencies.
RUN wget https://raw.githubusercontent.com/emp-toolkit/emp-readme/master/scripts/install.py
RUN python3 install.py --deps --tool

# setting up for GigaDORAM.
RUN ./compile.sh 


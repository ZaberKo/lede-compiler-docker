FROM ubuntu:20.04
LABEL maintainer="zaber" version="20.04"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN apt-get update \
    && apt-get upgrade -y
    
RUN apt-get install -y build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync

ARG USERNAME=fubuki

RUN apt-get install -y sudo && useradd -m -G sudo ${USERNAME}
# RUN git clone https://github.com/coolsnowwolf/lede
USER ${USERNAME}
WORKDIR /home/${USERNAME}/lede

ENV TERM xterm-color


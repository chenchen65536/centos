FROM centos:7
RUN echo 'root:wangjile' | chpasswd
RUN apt-get update

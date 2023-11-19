FROM centos:7
RUN echo 'root:wangjile' | chpasswd
RUN yum list
RUN yum -y update

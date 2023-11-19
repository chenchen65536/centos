FROM centos:7
RUN echo 'root:wangjile' | chpasswd
#RUN yum list
#RUN yum -y update
RUN yum -y install wget unzip
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
RUN mv ngrok /usr/local/bin/

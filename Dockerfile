FROM ubuntu:latest
RUN echo 'root:wangjile' | chpasswd
#RUN yum list
#RUN yum -y update
RUN apt update
RUN apt-get install -y wget unzip curl jq
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
RUN mv ngrok /usr/local/bin/

RUN ngrok authtoken "2YHkhUsZ3h3UdQXzJ6u8IFDi87O_3wEnoQN5J5zAQLNpdkZis"
#CMD ngrok tcp --region eu 22 --log=stdout &
RUN ngrok tcp --region eu 22 > test.txt
RUN cat test.txt

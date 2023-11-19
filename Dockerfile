FROM ubuntu:latest
RUN echo 'root:wangjile' | chpasswd
#RUN yum list
#RUN yum -y update
RUN apt update
RUN apt-get install -y wget unzip curl jq ssh net-tools
RUN echo "PasswordAuthentication yes" > /etc/ssh/sshd_config
RUN echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN service ssh restart

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
RUN mv ngrok /usr/local/bin/

RUN ngrok authtoken "2YHkhUsZ3h3UdQXzJ6u8IFDi87O_3wEnoQN5J5zAQLNpdkZis"

RUN netstat -anplt
#ENTRYPOINT ngrok tcp --region eu 22 --log=stdout &
#RUN sleep 5
#RUN public_ip=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
#RUN echo "Public IP Address: $public_ip"

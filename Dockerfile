FROM centos:7
RUN echo 'root:wangjile' | chpasswd
#RUN yum list
#RUN yum -y update
RUN yum -y install wget unzip curl
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
RUN mv ngrok /usr/local/bin/

RUN ngrok authtoken "2YHkhUsZ3h3UdQXzJ6u8IFDi87O_3wEnoQN5J5zAQLNpdkZis"
RUN ngrok tcp --region eu 22 &
RUN public_ip=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
RUN echo "Public IP Address: $public_ip"

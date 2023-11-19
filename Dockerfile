FROM centos:7
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:wangjile' | chpasswd

EXPOSE 4200 7800

CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
